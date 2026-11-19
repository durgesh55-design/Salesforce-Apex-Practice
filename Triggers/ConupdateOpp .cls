//when ever create a contact automatically update opprtunity fields.
 
trigger scenario17 on Contact (after insert) {  
    list<opportunity>op=[select id,name,stagename,Description,amount from opportunity limit 50];  
    for(contact c:trigger.new){          
        for(opportunity o:op)  
        {  
            if(o.amount<5000||o.Amount==null)  
            {  
                o.amount=5000;  
                o.Name=o.Name+'Mr';  
                o.StageName='prospecting';  
                  
            }  
            else{  
            o.Amount=o.Amount+1000;  
            o.Name=o.Name+'Dr';  
        }  
        update o;  
        }   
    }  
  
} 