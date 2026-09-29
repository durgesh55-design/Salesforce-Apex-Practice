Apex Class
Trigger Class
public class ContactTriggerHandler 
{
    public static void BeforeInsertBeforeUpdate(list<contact> Newlist)
    {
        set<id> conaccids = new set<id>();
        
        for(contact con : Newlist)
        {
            conaccids.add(con.AccountId);
            
            if(con.Birthdate > date.today())
            {
                con.Birthdate.adderror('Invalid Birthday');
                
            }
            
            // Gender Value
            if(con.Salutation == 'Mr.')
            {
                con.Description = 'Male';
            }
            else if(con.Salutation == 'Ms.' || con.Salutation == 'Mrs.')
            {
                con.Description = 'Female';
                
            }
            
            //Mailing Country
            if(con.MailingCountry != Null && con.MailingState == Null)
            {
                con.MailingState.adderror('Please Select the State');
            }
        }
            
/* Not more than 3 contacts to single account
        account relAcc = [SELECT Id FROM Account WHERE id IN:conaccids limit 1];
        list<contact> conlist = [SELECT id FROM Contact WHERE AccountId =: relAcc.Id];
        for(contact CheckCon : Newlist)
        {
            if(conlist.size()>=3)
            {
                checkCon.adderror('Contact Limit Exceeded, Not More than 3 Contacts for single Account');
            }
        }
*/
        
            
        
    }

    public void BeforeDelete(List<contact> OldList)
    {
        for(Contact con : Oldlist)
        {
            if(con.AccountId != Null)
            {
                con.adderror('Can not delete the contact since it is related to an account');
            }
            
        }
        
    }

    public void AfterInsertAfterUpdate(list<contact> Newlist)
    {
        list<task> talist = new list<task>();
        for(contact con : Newlist)
        {
            if(con.Phone == Null)
            {
                task ta = new task();
                ta.Subject = 'get the contact details';
                ta.WhoId = con.Id;
                ta.OwnerId = con.OwnerId;
                ta.ActivityDate = date.today().addDays(4);
                talist.add(ta);
            }
        }
        insert talist;
    }
    
}


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
    @istest private static void BeforeDeleteTest()
    {
        Account acc = New Account();
        acc.Name = 'kiran';
        acc.Type = 'Prospect';
        acc.AnnualRevenue = 908999;
        acc.Industry = 'Education';
        insert acc;
        
        Contact con = new Contact();
        con.firstName = 'Joe';
        con.lastName = 'Doe';
        con.Email = 'klg@gmail.com';
        con.accountId = acc.id;
        Insert con;
        
        try
        {
            delete con;
        }
        catch(exception e)
        {
            system.assert(e.getmessage().contains('Can not delete the contact since it is related to an account'));
        }
        
        
        
    }
    @istest private static void AfterInsertAfterUpdateTest()
    {
        Contact con = new Contact();
        con.firstName = 'Joe';
        con.lastName = 'Doe';
        con.Email = 'joe@gmail.com';
        Insert con;
        
        list<task> ta = [select id FROM task WHERE whoid = : con.id];
        
        system.assertequals(1, ta.size());
        
        
        
    }

}




