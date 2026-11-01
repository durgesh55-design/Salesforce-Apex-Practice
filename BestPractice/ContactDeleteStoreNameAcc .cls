public class ContactDeleteStoreNameAcc 
{
    //Whenever a Contact is deleted, store the deleted Contact Name in Account Description.
    public static void AfterDelete(List<Contact>OldList)
    {
        Set<Id>AccId = new Set<Id>();
        for(Contact con : OldList)
        {
            if(con.AccountId != Null)
            {
                AccId.add(con.accountId);
            }
            
        }
        if(AccId.IsEmpty())
        {
            Return ;
        }
        
        List<Account>acclist =[SELECT Id ,(SELECT Id ,FirstName FROM Contacts) FROM Account WHERE Id IN : AccId];
        
        List<Account>addAcc = new List<Account>();
        for(Account acc : acclist)
        {
            For(Contact con1 : acc.Contacts)
            {
                acc.Description=con1.FirstName.Replace(' ','') + ',';
            }
            
            addAcc.add(acc);
        }
        Update addAcc;        
        
    }
}