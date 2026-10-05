public class AccountCreated7Days 
{
    public static void BeforeUpdate(List<Account>newList)
    {
        for(Account acc : newList)
        {
            if(acc.CreatedDate <= System.now().adddays(-7))
            {
                acc.adderror('This Account cannot be edited because it was created 7 or more days ago.');
            }
        }
    }

}