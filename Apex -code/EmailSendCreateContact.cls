trigger SendEmails on Contact (After Insert) 
{
    //send email to contact when record is created.

    For(Contact con : trigger.new)
    {
        if(con.Email != Null)
        {
            List<String> tolist = new List<String>();
            tolist.add(con.Email);
            Messaging.SingleEmailMessage  SEM = new Messaging.SingleEmailMessage();
            SEM.settoaddresses(tolist);
            SEM.setSubject('Record is Created');
            SEM.setPlainTextBody('Dear '+ con.LastName +',\n Congratulation Your Record is Created Check Details Below \n Name= '+con.FirstName+'\n LastName=  '+con.LastName+'\n Email = '+con.Email+'\n Thanks Regard Salesforce Team.');
            
            
        }
    }
    
}