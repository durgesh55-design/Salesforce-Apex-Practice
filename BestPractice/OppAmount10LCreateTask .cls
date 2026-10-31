public class OpportunityCreateTask 
{
  //If an Opportunity amount exceeds ₹10,00,000, create an Approval Task.
   
    public static void AfterInsert(List<Opportunity>NewList)
    {
        List<Task>talist = new List<Task>();
        for(Opportunity opp : NewList)
        {
            if(opp.Amount >= 1000000)
            {
                Task ta = new Task();
                
                ta.WhatId = opp.AccountId;
                ta.WhoId = opp.Id;
                ta.Subject=('Opportunity amount exceeds ₹10,00,000.');
                ta.Priority='Normal';
                talist.add(ta);
            }
        }
        Insert talist;
        }
    }
}