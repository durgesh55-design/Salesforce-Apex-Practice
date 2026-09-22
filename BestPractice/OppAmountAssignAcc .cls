public class OpportunityTriggerHandler 
{
    //. Account records should have a field named ‘Recent Opportunity Amount’. It should 
    // contain the opportunity amount of the latest created opportunity on account.  
    
    public static void AfterInsert(List<Opportunity>NewList)
    {
        Map<Id, Decimal>IdSet = new Map<Id, Decimal>();
        
		for(Opportunity opp : NewList)
        {
            if(opp.Amount != Null && opp.AccountId != Null)
            {
			IdSet.put(opp.AccountId , opp.Amount);    
            }
        }
        List<Account> accList = [Select Id,Name From Account WHERE id IN : IdSet.KeySet()];
        
        for(Account acc : accList)
        {
            acc.Recent_Opportunity_Amount__c = IdSet.get(acc.Id);
        }
        Update accList;
    }
}