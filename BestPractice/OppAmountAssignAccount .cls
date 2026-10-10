public class OpportunityCountAccount 
{
    //Count total Opportunities and store Amount the count on Account.
        
    public static void AfterInsert(List<Opportunity>newList)
    {
        Set<Id>IdSet = new Set<Id>();
        for(Opportunity opp : newList)
        {
            if(opp.AccountId != Null)
            {
                IdSet.add(opp.AccountId);
            }
        }
        if(!IdSet.isEmpty())
        {
            Return;
        }
        
        List<Account>accList = [Select Id, Name,(SELECT Id, Amount FROM Opportunities) FROM Account WHERE Id IN : IdSet];
        
        for(Account acc : accList)
        {
            for(Opportunity opp : acc.Opportunities)
            {
                acc.BillingLatitude = opp.Amount;
            }
        }
        Update accList;
        
    }

}