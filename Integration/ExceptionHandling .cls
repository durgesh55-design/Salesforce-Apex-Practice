public class ExceptionHandlingDemo 
{
   //Exception Handling Account and Contact Record Deta.
    public static void exceptionMethod()
    {
        Account acc = new Account();
        acc.Name = 'Testing Exception';
        acc.AccountNumber = 'Fai8980';
        acc.Phone = '57657746767';
        acc.NumberOfEmployees = 890;
        acc.SLAExpirationDate__c = date.newinstance(2026,10,09);
        try
        {
            Insert acc;
            system.debug(acc);
            
        }
        catch(exception ex)
        {
            system.debug(ex.getlinenumber());
            system.debug(ex.getmessage());
            
        }
        
        
        Contact con = new Contact();
        con.firstName = 'Pranay';
        con.lastName = 'kumar';
        con.Email = 'Pranay@gmail.com';
        try
        {
            Insert con;
            system.debug(con);
            
        }
        catch(exception e)
        {
            system.debug(e.getlinenumber());
            system.debug(e.getmessage());
            
        }
    }

}

