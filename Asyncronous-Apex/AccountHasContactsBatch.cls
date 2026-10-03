public class AccountContactBatch implements Database.Batchable<Account>
{
    public Database.QueryLocator start(Database.BatchableContext sbc)
    {
        return Database.getQueryLocator(
            'SELECT Id, Has_Contacts__c, (SELECT Id FROM Contacts) FROM Account'
        );
    }

    public void execute(Database.BatchableContext bc, List<Account> accList)
    {
        for(Account acc : accList)
        {
            if(acc.Contacts.size() > 0)
            {
                acc.Has_Contacts__c = true;
            }
            else
            {
                acc.Has_Contacts__c = false;
            }
        }

        update accList;
    }

    public void finish(Database.BatchableContext bc)
    {
        System.debug('Account Contact Batch Completed');
    }
}