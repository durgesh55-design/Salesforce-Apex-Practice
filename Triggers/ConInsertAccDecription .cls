trigger ConInsertAccDecription on Contact (After Insert) 
{
    //Update Account Description with the latest Contact created date.

    List<id>Idset = new List<Id>();
    for(Contact con : Trigger.new)
    {
        if(con.AccountId != Null)
            for(Contact con1 : acc.Contacts)
        {
            acc.Description='Letest Contact Date '+ String.valueof(con1.CreatedDate);
        }
        
        
    }
    Update acclist;
}