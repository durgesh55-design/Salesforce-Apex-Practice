public class CreateAccountCreateCase
{
  //Create a Case automatically when a new Customer Account is created.
  public static void AfterInsert(List<Account>NewList)
  {
      List<Case>csList = new List<Case>();
      for(Account acc : NewList)
      {
         if(acc.Type == 'Customer')
         {
             Case cs = new Case();
            cs.Subject = 'Welcome New Customer';
            cs.Status = 'New';
            cs.Origin = 'Web';
            cs.AccountId = acc.Id;
			csList.add(cs);
         }
          
      }
      if(!csList.IsEmpty())
      {
          Update csList;
      }
  }
}