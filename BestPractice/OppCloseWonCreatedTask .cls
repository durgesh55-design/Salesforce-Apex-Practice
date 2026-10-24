public class OppIsWonCreateCase
{
    //Create a Follow-up Task automatically when an Opportunity becomes Closed Won.
    
	public static void AfterInsertAfterUpdate(List<Opportunity>NewList , Map<Id, Opportunity>oldMap)
    {
		List<Task>talist = new List<Task>();
        for(Opportunity opp : NewList)
        {
             Opportunity oldOpp = oldMap.get(opp.Id);
            
            if(opp.StageName == 'Closed Won' && oldOpp.StageName != 'Closed Won')
            {
                Task t = new Task();
                t.Subject = 'Follow up with customer';
                t.WhatId = opp.Id;
                t.OwnerId = opp.OwnerId;
                t.ActivityDate = Date.today().addDays(7);
                t.Status = 'Not Started';
                t.Priority = 'Normal';
				
                talist.add(t);
                
            }
        }
        Insert talist;
    }
}