// Batch class to update phone numbers for accounts

public class BatchPhone implements database.batchable<sObject>
{
    public Database.queryLocator start(Database.BatchableContext SBC)
    {
        return Database.getQueryLocator('SELECT Id From Account WHERE Phone = Null LIMIT 10');
        
    }
    public void execute(Database.BatchableContext EBC , List<Account>acclist)
    {
        for(Account acc : acclist)
        {
            acc.Phone='8010888232';
            
        }
        Update acclist;
    }
    
    public void Finish(Database.BatchableContext FBC)
    {
        List<messaging.SingleEmailMessage> SEMlist = new List<messaging.SingleEmailMessage>();
        
        List<String>tolist = new List<String>();
        tolist.add('komalpatil55990@gmail.com');
        tolist.add('durgeshforce5@gmail.com');
        
        List<String>cclist = new List<String>();
        cclist.add('nehapatilll5599@gmail.com');
        
        messaging.SingleEmailMessage SEM = new messaging.SingleEmailMessage();
        SEM.settoaddresses(tolist);
        SEM.setccaddresses(cclist);
        
        SEM.setsubject('Phone Number Updated');
        SEM.setplaintextbody('Dear Admin \n Starting 10 Account Number are Updated Successfully');
        
        SEMlist.add(SEM);
        Messaging.SendEmail(SEMlist);
        
    }
}