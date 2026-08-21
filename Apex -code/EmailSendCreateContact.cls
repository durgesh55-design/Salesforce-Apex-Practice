trigger SendEmails on Contact (After Insert) 
{
    // This trigger is used to send email to the contact when a new contact record is created in Salesforce.

    For(Contact con : trigger.new)
    {
        if(con.Email != Null)
        {
            List< Messaging.SingleEmailMessage> SEMlist = new List< Messaging.SingleEmailMessage>();
            List<String> tolist = new List<String>();
            tolist.add(con.Email);
            Messaging.SingleEmailMessage  SEM = new Messaging.SingleEmailMessage();
            SEM.settoaddresses(tolist);
            SEM.setSubject('Record is Created');
            SEM.setPlainTextBody('Dear '+ con.LastName +',\n Congratulation Your Record is Created Check Details Below \n Name= '+con.FirstName+'\n LastName=  '+con.LastName+'\n Email = '+con.Email+'\n Thanks Regard Salesforce Team.');
            
            SEMlist.add(SEM);
            Messaging.SendEmail(SEMlist);
        }
        
    }
    
}