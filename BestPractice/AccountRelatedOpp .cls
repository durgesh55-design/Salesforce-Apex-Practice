public class AccountRelatedOpp
{
    //Write a trigger on Account when Account Active field is updated from ‘Yes’ to ‘No’ then 
	//check all opportunities associated with the account. Update all Opportunities Stage to 
	//close lost if stage not equal to close won. 
	
    public static void AfterUpdate(List<Account>NewList , map<Id ,Account>OldMap)
    {
        List<Id>AccList = new List<Id>();
        for(Account acc : NewList)
        {
            Account OldAcc = OldMap.get(acc.Id);
            
            if(OldAcc.Active__c =='Yes' && acc.Active__c =='No')
            {
                AccList.add(acc.Id);
            }
        }
        
        List<Opportunity> oppList = [SELECT Id, StageName FROM Opportunity WHERE accountId IN : AccList];
        
        for(Opportunity opp : oppList)
        {
            if(Opp.StageName != 'Closed Won')
            {
              Opp.StageName='Closed Lost';  
            }
            
        }
        Update oppList;
    }

}