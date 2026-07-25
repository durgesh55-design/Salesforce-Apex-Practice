public class parameter {

    public static Contact Method( String a){
        
       Contact con = new Contact();
        con.LastName=a;
        con.Email=a+'@gmail.com';
        con.Phone='9876543210';
        insert con;
        System.debug(con);
        return con;
    }
    public static integer method2( integer a , integer  b ){
        
        integer c = a*b;
        System.debug(c);
        return c;
        
    }
    public static integer table(integer num){
        
        for(integer i=1; i<=10;  i++){
            
            System.debug(num + 'X'+ i+'='+(num*i));
        }
        
            return num;
    }
    
    // Recurment -  One cleck create auto demo record we want to create  record  only inter number 
    
    public static void CreateRecord(integer no){
        
        List<Account> acclist = new List<Account>();
         
        for(integer j=1 ; j<=no; j++){
            
            Account acc = new Account();
            acc.Name='Molanisa'+j;
            acc.Fax='90909090'+j;
            acc.Rating='Warm';
            acclist.add(acc);
        }
        insert acclist;
        System.debug(acclist);
    }
}