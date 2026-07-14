public class CreateAccCon {

    public static void method1()
    {
        Account acc = New Account();
        acc.Name='Rolex pvt ltd';
        acc.Rating= 'Cold';
        acc.AccountNumber= 'Rx-9298392';
        acc.Phone= '8080585310';
        
        Insert acc;
        System.debug(acc);
        
        Contact con = New Contact();
        con.FirstName='Abhishek';
        con.LastName= 'Patil';
        con.Phone=acc.Phone;
        con.Email='abhi89@gmail.com';
        con.AccountId=acc.Id;
        
        Insert con;
        System.debug(con);
    }
}