//when ever a opportunity created record amount field is calculated by account total field  

trigger scenario21 on Opportunity (after insert,after update,after delete) 
{  
    set<id>ids=new set<id>();  
    map<id,opportunity>opp=new map<id,opportunity>();  
    Decimal oldVal;  
    Decimal newVal;  
    if(trigger.isinsert)  
    {  
        for(opportunity op:trigger.new)  
              
        {  
            ids.add(op.AccountId);  
            opp.put(op.AccountId, op);  
        }  
        list<account> acc=[select id,Total_Amount__c from account where  id=:ids];  
        for(account a:acc)  
        {  
            if(a.Total_Amount__c==null )  
            {  
            a.Total_Amount__c=opp.get(a.Id).amount;  
            }  
            else  
            {  
              
            a.Total_Amount__c= a.Total_Amount__c+opp.get(a.Id).amount;  
            }  
        }  
        update acc;  
    }  
    if(trigger.isUpdate)  
    {  
    for(opportunity op:trigger.new)  
              
        {  
            ids.add(op.AccountId);  
            opp.put(op.AccountId, op);  
            newVal=op.Amount;  
        }  
        for(Opportunity  ops:trigger.old){  
            oldVal=ops.Amount;  
        }  
        list<account> acc=[select id,Total_Amount__c from account where  id=:ids];  
        for(account a:acc)  
        {  
            if(a.Total_Amount__c==null )  
            {  
            a.Total_Amount__c=opp.get(a.Id).amount;  
            }  
            else  
            {  
              
            a.Total_Amount__c= a.Total_Amount__c+opp.get(a.Id).amount-oldVal;  
            }  
        }  
        update acc;  
        }  
}  
