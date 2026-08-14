@istest public class ContactTriggerHandlerTest 
{
    @istest private static void BeforeInsertBeforeUpdateTest()
    {
        Contact con = new Contact();
        con.firstName = 'Joe';
        con.lastName = 'Doe';
        con.Email = 'klg@gmail.com';
        con.Birthdate = date.newinstance(2026,09,16);
        
        try
        {
            Insert con;
        }
        catch(exception e)
        {
            system.assert(e.getmessage().contains('Invalid Birthday'));
        }
        
        Contact con1 = new Contact();
        con1.Salutation = 'Mr.';
        con1.firstName = 'Joe';
        con1.lastName = 'Doe';
        con1.Email = 'klg@gmail.com';
        insert con1;
        
        contact getCon1 = [SELECT ID, Description FROM Contact WHERE Id =: Con1.id];
        
        system.assertequals('Male',getCon1.Description);
        
        Contact con2 = new Contact();
        con2.Salutation = 'Ms.';
        con2.firstName = 'pandu';
        con2.lastName = 'kumari';
        con2.Email = 'plk@gmail.com';
        insert con2;
        
        contact getCon2 = [SELECT ID, Description FROM Contact WHERE Id =: Con2.id];
        
        system.assertequals('Female',getCon2.Description);
        
        
        Contact con3 = new Contact();
        con3.firstName = 'Pavan';
        con3.lastName = 'dev';
        con3.Email = 'PDV@gmail.com';
        con3.MailingCountry = 'India';
        try
        {
            insert con3;
            
        }
        catch(exception e)
        {
            system.assert(e.getMessage().contains('Please Select the State'));
        }
        
        
        
    }
}