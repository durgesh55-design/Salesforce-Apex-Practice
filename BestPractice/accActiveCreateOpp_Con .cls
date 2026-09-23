public class AccountActiveCreated 
{
    //10. On Account create two checkbox fields labeled as Contact and Opportunity. Now when a 
	//new Account record is created and if a particular Contact or Opportunity checkbox is 
	//checked then create that related record. Also, Opportunity record should be created only 
	//if the Account record Active picklist is populated with a Yes. 
	
	public static void AfterInsert(List<Account>NewList)
    {
        List<Contact>ConList = New List<Contact>(); 
        List<Opportunity>oppList = new List<Opportunity>();
        for(Account acc : NewList)
        {
            if(acc.Contact_Create__c == True && acc.Active__c == 'Yes')
            {
                Contact con = new Contact();
                con.LastName='Practice';
                con.Email= 'practice@mail.com';
                con.AccountId= acc.Id;
                con.Phone='9090821232';
               	ConList.add(con);
                
            }
            if(acc.Opportunity_Create__c == True && acc.Active__c == 'Yes')
            {
                Opportunity opp = new Opportunity();
                opp.Name ='Practice 1';
                opp.Amount=50000;
                opp.StageName='Close Won';
                opp.CloseDate=Date.NewInstance(2026,9,30);
                oppList.add(opp);
                
            }
        }
        Insert ConList;
        Insert oppList;
        
    }
}