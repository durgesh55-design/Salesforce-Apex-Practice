public class ExeptionPractice {
    
    public static void TryMethod() {
        
        Account acc = new Account();
        acc.Name = 'Try Catch';
        acc.Rating = 'Hot';
        acc.Phone = '9876543210';
        
        try {
            insert acc;
        }
        catch (Exception ex) {
            System.debug(ex.getLineNumber());
            System.debug(ex.getMessage());
        }
        
        Contact con = new Contact();
        con.LastName = 'try Finish';
        con.Email = 'try@gmail.com';
        con.Phone = '9876543210';
        con.AccountId = acc.Id;
        
        insert con;
    }
}