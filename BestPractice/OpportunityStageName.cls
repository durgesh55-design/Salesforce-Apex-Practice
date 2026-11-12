//. when ever opportunity stagename =closedwon automatically update the account field rating=hot  
  
trigger scenario12 on Opportunity (after insert,after update) {  
    set<id>ids=new set<id>();  
    list<account>ac=new list<account>();  
    for(opportunity op:trigger.new)  
    {  
        ids.add(op.AccountId);  
      
    ac=[select id,name,rating from account where id=:ids];  
        if(op.StageName=='Closed won')  
        {  
  
            for(account a:ac)  
            {  
                a.Rating='hot';  
            }  
            update ac;  
        }  
        }  
      
  
}  





//. when ever opportunity stagename =closedwon automatically update the account field rating=hot  
  
trigger scenario12 on Opportunity (after insert,after update) {  
    set<id>ids=new set<id>();  
    list<account>ac=new list<account>();  
    for(opportunity op:trigger.new)  
    {  
        ids.add(op.AccountId);  
      
    ac=[select id,name,rating from account where id=:ids];  
        if(op.StageName=='Closed won')  
        {  
  
            for(account a:ac)  
            {  
                a.Rating='hot';  
            }  
            update ac;  
        }  
        }  
      
  
}  