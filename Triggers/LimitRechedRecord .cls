//6.limit reached the records  
  
trigger SCENARIO6 on Account (before insert,before update) {  
    integer count=0;  
    list<account>a=[select id,name from account where createddate=today or lastmodifieddate=today];  
    for(account ac:trigger.new)  
    {  
       count=a.size();  
        ac.NumberofLocations__c=count;  
        if(count>2)  
         {  
            ac.adderror('reached limit today');  
        }  
        }  
  
}  