trigger accountTrigger on Account (Before insert , Before Update ,Before Delete, After Insert, After Update, After Delete , After Undelete)
{
    //If any account is going to Delete, check how many contacts it has. If it has contacts do not allow it to 
    //delete the account ⇒

    if(trigger.isBefore)
    {
        if(trigger.isDelete)
        {
            for(Account acc : trigger.old)
            {
                List<Contact> conlist=[SELECT Id ,Name FROM Contact WHERE accountId=: acc.Id];
                integer i = conlist.size();
                
                if( i > 0)
                {
                  acc.addError('Can not delete the account since it has '+i+ ' contacts '); 
                }
                
            } 
        }
    }
}