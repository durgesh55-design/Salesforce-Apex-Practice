public class CloseOppCountOnAccount 
{
    //Store the number of Closed Won Opportunities on Account. 
    
	public static void AfterUpdate(List<Opportunity>NewList)
    {
        Set<Id>AccId =  new Set<Id>();
        for(Opportunity opp : NewList)
        {
            if( opp.AccountId != Null)
            {
                AccId.add(opp.AccountId);
            }
        }
        List<Account>acclist=[SELECT Id,(SELECT id FROM Opportunities WHERE StageName = 'Closed Won') FROM Account WHERE Id IN : AccId];
        
        for(Account acc : acclist)
        {
            Integer opplist = acc.Opportunities.size();
            
            acc.Closed_Won_Opportunity_Count__c = opplist;
        }
		if(!acclist.isEmpty())
        {
			Update acclist;            
        }
    }
}