public class OneClickCRecord {
    
    public static void ClickRecord(integer num){
        
        List<Account> acclist = new List<Account>();
        List<Contact> conlist = new List<Contact>();
        List<Case> calist = new List <Case>(); 
        
        for(integer i=1; i<num; i++){
            
            Account acc = new Account();
            
            acc.id='001g500000WmgMoAAJ';
            Contact con = new Contact();
            con.LastName='Lankesh'+i;
            con.Email='lankesh'+i+'@gmail.com';
            con.Phone='9987392832';
            con.Birthdate= date.newInstance(2007,12,3);
            con.AccountId=acc.Id;
            conlist.add(con);
            System.debug(con);
            
            
            Case ca = new Case();
            ca.AccountId=acc.Id;
            ca.ContactId=con.Id;
            ca.Status='Working';
            ca.Priority='Medium';
            ca.Type='Mechanical';
            ca.Reason='Other';
            calist.add(ca);
            System.debug(ca);
        }
        insert acclist;
        insert conlist;
        insert calist;

    }
    
    
}