trigger SCENARIO1 on Account (after insert) {  
    list<contact> c=new list<contact>();  
    for(account a:trigger.new)  
    {  
        contact b=new contact();  
        b.LastName=a.Name;  
        b.AccountId=a.Id;  
        c.add(b);  
          
          
          
    }  
    insert c;  
  
}  