public class OpportunityAssignTask 
{
    //When a Opportunity Stage (field) is Prospecting, create a Task record on Opportunity and 
	//assign it to Logged In User/Opportunity Owner / Any User. 
	
    public static void AfterInsert(List<Opportunity>oppList)
    {
        List<Task>taList = new List<Task>(); 
        for(Opportunity opp : oppList)
        {
            if(opp.StageName == 'Prospecting')
            {
                Task ta = new Task();
                ta.WhatId=opp.AccountId;
                ta.OwnerId=opp.OwnerId;
                ta.WhoId=opp.ContactId;
                ta.Subject='Opportunity Stage (field) is Prospecting';
                ta.Priority='Normal';
                taList.add(ta);
                
            }
        }
        Insert taList;
    }
}