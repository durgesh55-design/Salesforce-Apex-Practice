public class RetriveAccountNoCon 
{
  //How would you retrieve Accounts that have no related Contacts?
    public static void Method()
    {
        List<Account> acclist = [SELECT Id, Name FROM Account WHERE Id NOT IN (SELECT AccountId FROM Contact)];
        
        for(Account acc : acclist)
        {
          System.debug(acc.Name.trim() + '\n');
        }
    }
}