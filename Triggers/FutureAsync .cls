public class FutureAsync
{
    // This method is used to update the user record asynchronously using @future annotation

    @future
	public static void UpdateUser()
    {
        user ur = [SELECT Id ,IsActive FROM User WHERE Username ='anurag00@gmail.com'];
        
        ur.IsActive=False;
        Update ur;
        System.debug(ur);
    }
    public static void InsertCase()
    {
        // Call UpdateUser
        FutureAsync.UpdateUser();
        
        Case ca = new Case();
        ca.Origin='web';
        ca.Status='New';

        
        Insert ca;
        System.debug(ca);
    }
}