public class longRunningOpration
{
    
  // This method is used to create multiple account records in a loop

    @futurepublic static void CreatingAccount()
    {
        for(integer i=0; i<15; i++){
            Account acc = new Account();
            acc.Name='Xerobin'+i;
            acc.Phone='98998989'+i;
            insert acc;
            System.debug(acc);
        }    
    }
    // This method is used to create multiple contact records in a loop

    @future public static void CreatingContact()
    {
        for(Integer i=0; i<10; i++){
            Contact con = new Contact();
            con.LastName='Zebinal'+i;
            con.Phone='909087749'+i;
            con.Email='zebinal'+i+'@gmail.com';
            insert con;
            System.debug(con);
            
        }
    }
    // This method is used to create a case record after creating account and contact records

    public static void CreatingCase()
    {
        longRunningOpration.CreatingAccount();
        longRunningOpration.CreatingContact();
        
        Case ca = new Case();
        ca.Status='Working';
        ca.Origin='Phone';
        insert ca;
        System.debug(ca);
    }
   
}