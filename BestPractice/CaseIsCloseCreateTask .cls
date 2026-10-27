public class CaseIsCloseCreateTask 
{
	//Whenever a Case is closed, create a follow-up Task.
	
    public static void AfterUpdate(List<Case>NewList, Map<Id,Case>oldmap)
    {
        List<Task>talist= new List<Task>();
        for(Case ca : NewList)
        {
            case OldCase = oldmap.get(ca.Id);
            if(ca.Status == 'Closed' && OldCase.Status != ca.Status)
            {
				Task ta = new task();
                ta.WhatId = ca.OwnerId;
                ta.WhoId = ca.ContactId;
                ta.Subject = ca.Description;
                
                talist.add(ta);
            }
        }
        Insert talist;
    }
}