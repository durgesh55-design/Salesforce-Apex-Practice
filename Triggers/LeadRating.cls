trigger CleadTrigger on Lead (before insert) 

//Whenever Lead is created with LeadSource as Web then give rating as cold otherwise hot.

{
    for(Lead ld : Trigger.new)
    {
        if(ld.LeadSource == 'Web')
        {
            ld.Rating = 'Cold';
        }
        else
        {
            ld.Rating = 'Hot';
        }
    }
}