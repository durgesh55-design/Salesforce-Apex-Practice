public class AccountAdministatorAllowDelete 
{
    // Write a trigger on Account and check only System Administrator profile users should be 
    //able to delete an account.
    
    public static void BeforeDelete(List<Account>OldList)
    { 
        
        if(userInfo.getprofileId() != [SELECT id,Name FROM Profile WHERE Name = 'System Administrator'].Id)
        {
            for(Account acc : OldList)
            {
                acc.adderror('Only System Administrators can delete Accounts.');
            }
        }
        
    }
}