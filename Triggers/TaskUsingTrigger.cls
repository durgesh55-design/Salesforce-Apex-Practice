trigger phoneTask on Contact (after insert, after update) 
{
    for(contact con : trigger.new)
    {
        if(con.Phone == Null)
        {
            task ta = new task();
            ta.Subject = 'get the contact details';
            ta.WhoId = con.Id;
            ta.OwnerId = con.OwnerId;
            ta.ActivityDate = date.today().addDays(4);
            insert ta;
        }
    }

}