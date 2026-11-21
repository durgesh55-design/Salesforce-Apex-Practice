  
//13.when ever a create a lead object automatically converted account ,contact,opportunity.
  
trigger scenario19 on Lead (after insert) {  
    list<account>acc=new list<account>();  
    list<contact>con=new list<contact>();  
    list<opportunity>op=new list<opportunity>();  
    for(lead l:trigger.new)  
    {  
        account a=new account();  
        a.Name=l.lastname;  
        a.Phone=l.Phone;  
        acc.add(a);  
        contact c=new contact();  
        c.LastName=l.Name;  
          
        con.add(c);  
        opportunity o=new opportunity();  
        o.Amount=l.AnnualRevenue;  
        o.CloseDate=system.today();  
        o.StageName='closed won';  
        op.add(o);  
    }  
    insert acc;  
    insert con;  
    insert op;  
  
} 