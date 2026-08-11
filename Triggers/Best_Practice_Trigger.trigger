trigger accountTrigger on Account (before insert , before update, before delete, after insert , after update, after delete ,after undelete)
{

    if(trigger.isBefore)
    {
        if(trigger.isInsert || trigger.isUpdate)
        {
        //
          for(Account acc : trigger.new)
          {
              if(acc.Phone == Null)
              {
                 acc.phone.addError('This Field is Mandatory');
              }
          }
        }
    }
}