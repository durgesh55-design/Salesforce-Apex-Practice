trigger AccNumberCreatedCon on Account (After Insert , After Update) 
{
    // Creates the number of contacts which are equal to the number which we will enter in the 
	//Number of Locations field on the Account Object. 
    
    List<Contact> conlist = new List<Contact>();
    for(Account acc : trigger.new)
    {
        Account Oldacc = trigger.OldMap.get(acc.Id);
        if(Oldacc.NumberofLocations__c != acc.NumberofLocations__c)
        {
            Continue;
        }
        
        if(acc.NumberofLocations__c != Null)
        {
            integer StoreNum = acc.NumberofLocations__c.IntValue();
            
            if(StoreNum > 0)
            {
                For(integer i=1; i<=StoreNum; i++)
                {
                    Contact con = new Contact();
                    con.LastName = 'Record Demo'+i;
                    con.Phone = '908978672'+i;
                    con.AccountId = acc.id;
                    con.Email = 'demoData'+i+'@gmail.com';
                    
                    conlist.add(con);
                }
            }
        }
    }
    if(!Conlist.isEmpty())
    {
        Insert conlist;
    }

}