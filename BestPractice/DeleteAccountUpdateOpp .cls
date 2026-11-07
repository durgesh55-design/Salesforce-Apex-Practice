public class DeleteAccountOppWon 
{
  //Prevent deleting Accounts with Closed Won Opportunities.
   
    public static void AfterDelete(List<Account>OldList)
    {
        Set<Id>accId = new Set<Id>();
        for(Account acc : OldList)
        {
            accId.add(acc.Id);
        }
        List<Opportunity>opplist=[SELECT Id,StageName FROM Opportunity WHERE AccountId IN : accId];
        
        if(opplist.IsEmpty())
        {
            Return ;
        }
        
        List<Opportunity>OppUpdate=new List<Opportunity>();
        for(Opportunity opp : opplist)
        {
            opp.StageName='Closed Won';
            
            OppUpdate.add(opp);
        }
        if(!OppUpdate.IsEmpty())
        {
            Update OppUpdate;
        }
       
    }
{
  //Prevent deleting Accounts with Closed Won Opportunities.
   
    public static void AfterDelete(List<Account>OldList)
    {
        Set<Id>accId = new Set<Id>();
        for(Account acc : OldList)
        {
            accId.add(acc.Id);
        }
        List<Opportunity>opplist=[SELECT Id,StageName FROM Opportunity WHERE AccountId IN : accId];
        
        if(opplist.IsEmpty())
        {
            Return ;
        }
        
        List<Opportunity>OppUpdate=new List<Opportunity>();
        for(Opportunity opp : opplist)
        {
            opp.StageName='Closed Won';
            
            OppUpdate.add(opp);
        }
        if(!OppUpdate.IsEmpty())
        {
            Update OppUpdate;
        }
       
    }
}