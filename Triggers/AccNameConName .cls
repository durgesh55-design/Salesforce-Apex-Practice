//.when ever account name is naveen automatically update the contact all lastnames  
  
trigger scenario13 on Account (after update) {  
      
        string names;  
        list<contact>c=[select id,lastname,firstname from contact where lastname=:names ];  
        for(account a:trigger.new)  
        {  
            names=a.name;  
        }  
    for(contact con:c)  
    {  
        con.lastname=names;  
    }  
    update c;  
      
}  