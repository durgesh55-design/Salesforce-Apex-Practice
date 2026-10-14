//when ever a create opportunity object record updated total opportunies and total amount in account object  

trigger scenario24 on Opportunity (after insert) {  
    set<id>ids=new set<id>();  
    for(Opportunity op:trigger.new)  
    {  
        ids.add(op.accountid);  
    }  
    list<account>ac=[select Total_opportunities__c,Total_Amount__c,(select id,Amount from Opportunities ) from a
ccount where id=:ids];  
for(account a:ac)  
{  
   a.Total_opportunities__c=a.opportunities.size();  
    decimal sum=0;  
    for(opportunity p:a.opportunities)  
    {  
        sum=sum+p.amount;  
    }  
    a.Total_Amount__c=sum;  
      
      
}  
    update ac;  
}  