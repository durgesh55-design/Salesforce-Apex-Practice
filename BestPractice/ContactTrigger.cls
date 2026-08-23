trigger ContactTrigger on Contact (Before Insert , Before Update , Before Delete , After Insert , After Update , After Delete , After Undelete) 
{
//allowing the trigger to run for before insert and before update events

    if(trigger.isBefore)
    {
        if(trigger.isInsert || trigger.isUpdate)
        {
            ContactTriggerHandler.BeforeInsertBeforeUpdate(trigger.new);
            
            ContactTriggerHandler.BeforeInsertPhone(trigger.new);

        }
        if(trigger.isDelete)
        {
           ContactTriggerHandler.BeforeDelete(trigger.old);
        }
    }
    if(trigger.isAfter)
    {
        if(trigger.isInsert || trigger.isUpdate)
        {
            ContactTriggerHandler.AfterInsertAfterUpdate(trigger.new);
        }
    }
}