trigger OppAmountCount on Opportunity (After insert,After Update , After Delete , After Undelete ) 
{
	//Update Account Total Opportunity Amount whenever an Opportunity is inserted, updated, or deleted.
	
    Set<Id>Idset = new Set<Id>();
    if(Trigger.isInsert || Trigger.isUpdate || Trigger.isUndelete)
    {
        for(Opportunity opp : Trigger.new)
        {
            Idset.add(opp.AccountId);
        }
    }
    
    if(Trigger.isDelete || Trigger.isUpdate)
    {
        for(Opportunity opp1 : Trigger.old)
        {
            Idset.add(opp1.AccountId);
        }
    }

    
      // Calculate total Opportunity Amount per Account
    Map<Id, Decimal> totalMap = new Map<Id, Decimal>();

    for (AggregateResult ar : [
        SELECT AccountId, SUM(Amount) totalAmount
        FROM Opportunity
        WHERE AccountId IN :Idset
        GROUP BY AccountId
    ]) {
        totalMap.put(
            (Id) ar.get('AccountId'),
            (Decimal) ar.get('totalAmount')
        );
    }

    // Update Account totals
    List<Account> accountList = new List<Account>();

    for (Id accId : Idset) {
        accountList.add(new Account(
            Id = accId,
            Opportunity_Count__c =
                totalMap.containsKey(accId) ? totalMap.get(accId) : 0
        ));
    }

    if (!accountList.isEmpty()) {
        update accountList;
    }
}
