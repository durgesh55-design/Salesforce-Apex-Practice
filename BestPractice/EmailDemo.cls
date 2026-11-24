public class EmailDemo 
{
	public static void Method()
    {
        List<String>Toadd =  new List<String>();
        Toadd.add('kamleshpatil@gmail.com');
        List<String>Ccadd =  new List<String>();
        Ccadd.add('durgeshforce5@gmail.com');
        Messaging.SingleEmailMessage SEM = new Messaging.SingleEmailMessage();
        
        SEM.setToAddresses(Toadd);
        SEM.setCcAddresses(Ccadd);
        SEM.setSubject('Demo Email Dear Sir, \n');
        SEM.setPlainTextBody('Your Account is Blocked because your Transaction Limmit over');
        
    }
}