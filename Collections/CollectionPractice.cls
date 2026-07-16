public class Collection {
    
    public void method(){
        
        List<Contact> conlist = new List<Contact>();
        
        for(integer n=1; n<=50; n++ ){
            
            Contact con1 = new Contact();
            con1.LastName='Dole'+n;
            con1.Phone='9389279678';
            con1.Email = 'dole' + n + '@gmail.com';
            con1.Fax= '89232323';
            conlist.add(con1);
            
            
        }   
        Insert conlist;
        System.debug(conlist);  
        
    }
    public void method2(){
        
        List<Contact> conlist = new list<Contact>();
        
        for(integer i=1; i<50; i++){
            
            Contact con2 = New Contact();
            con2.LastName='Patil'+i;
            con2.Email='patil'+i+ '@gmail.com';
            con2.Phone='9823920293';
            conlist.add(con2);
        }
        Insert conlist;
        System.debug(conlist);
    }
    
    public static void getAccount(){
        
        // List<Account> getAcc = [SELECT Id,Name,Rating, AccountNumber From Account WHERE Rating='Hot'];//
        
        List<Account> getAcc = new List<Account>();
        
        getAcc= [SELECT Id , Name FROM Account];
        System.debug(getAcc);
        System.debug(getAcc.Size());
    }
    
    
    public static void mapMethod(){
        
        map< Id , Account> mapAcc = new map<id , Account>([SELECT Id , Name From Account]);
        System.debug(mapAcc);
        System.debug('The Account Values are '+mapAcc.values());
        System.debug('The Account Keyset are '+mapAcc.keyset());
        
        
        map<Id,Contact> mapcon = new map<Id,Contact>([SELECT Id , Name , Phone FROM Contact]);
        
        System.debug(mapcon.values());
        System.debug(mapcon.keyset());
        
    }
    
    public static void setCollection(){
        
        Set<String> setcon = New Set<String>();
        setcon.add('Durgesh');
        setcon.add('kamlesh');
        setcon.add('Durgesh');
        setcon.add('Jayesh');
        
        System.debug(setcon.size());
        setcon.remove('Durgesh');
        setcon.clear();
        System.debug(setcon);      
    }
    
    public static void task1(){
        
        Contact con = new Contact();
        
        con.LastName='Mule';
        con.Email='durgesh@gmail.com';
        Insert con;
        
        if(con.Phone == NUll ){
            
            con.Phone='92929372738';
            update con;  
        }
    }
    
    public static void deleteMethod(){
        
        List<Case> conlist =[SELECT Id  FROM Case WHERE CreatedDate=TODAY];
       
        delete conlist;
        System.debug(conlist);
    }
}