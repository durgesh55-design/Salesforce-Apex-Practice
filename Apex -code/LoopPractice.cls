public class LoopPractice{
    //Write a method to print 2 table using while loop
    public static void method1(){
        
        try{        integer i = 1;
            
            while(i <= 10){
                
                System.debug('2 X'+i+'=' +2*i );
                i++;
            }
           }
        catch(exception e){
            System.debug(e.getMessage());
        }
    }
    
    
    public static void forEachloop(){

        
        // Get the contacts with empty emails, Update them with sample@example.com
        
        List <Contact> conlist = [SELECT Id , Email FROM Contact WHERE Email=Null];
        
        for(Contact Con : conlist){
            
            con.Email= 'sample@example.com';
        }
        update conlist;
        System.debug(conlist);
    }
    
    public static void deleteAccount(){
        //Delete all the accounts created today
        
        List<Account> acclist = [SELECT Id FROM Account WHERE CreatedDate=TODAY];
        
        Delete acclist;
        System.debug(acclist);
        
        
    }
    
    public static void createAcc(){
        //Create 300 accounts using while loop
        
        List<Account> acclist = new List<Account>();
        
        integer i=1;
        
        while( i<=300){
            
            Account con =new Account();
            con.Name='Leo'+i;
            con.Fax='0000'+i;
            con.Rating='Hot';
            
            acclist.add(con);
            
            i++;
            
        }
        insert acclist;
        System.debug(acclist);
    }
    
    public static void UpdateAcc(){

        
        //get Account Update Phone number created by today 
        
        List<Account> listAcc = [SELECT Id , Phone FROM Account WHERE CREATEDDATE =TODAY];
        
        for(Account acc : listAcc){
            
            acc.Fax='9999888821';
            
        }
        update listAcc;
        System.debug(listAcc);
        
    }
    
    //Update Null Rating Using For Each loop  ' rating =  Worm '
    
    public static void UpdateMethod(){
        
        List<Account> acclist= [SELECT Id , Name , Rating  FROM Account WHERE Rating = Null];
        
        
        System.debug(acclist.size());
        
        for(Account acc : acclist){
            
            acc.Rating = 'Warm';
        }
        update acclist;
        System.debug(acclist);
    }
    
    public static void DeleteMetho(){
        //Delete all the accounts created in last 8 days
        
        List<Account> acclist = [SELECT Id , Name, createddate FROM Account WHERE  createddate= LAST_N_DAYS:8];
        
        Delete acclist;
        System.debug(acclist.size());
        
    }
    
    