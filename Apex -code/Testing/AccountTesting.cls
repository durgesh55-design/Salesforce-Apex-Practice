@istest public class AccountTriggerHandlerTest 
{
    // Test method for AccountTriggerHandler class

    
    @istest private static void BeforeDeletetest()
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
        con.Email = 'joeking@gmail.com';
        con.accountId = acc.id;
        Insert con;
        system.debug(con);
        
        try
        {
            delete acc;
        }
        catch(exception e)
        {
            system.assert(e.getMessage().contains('Can not delete the account since it has 1 contacts '));
        }
        
    }
    @istest Private static void BeforeInsertBeforeUpdateTest()
    {
        Account acc = New Account();
        acc.Name = 'kiran';
        acc.Type = 'Prospect';
        acc.Industry = 'Education';
        
        try
        {
            insert acc;
        }
        catch(exception e)
        {
            
            system.assert(e.getMessage().contains('Kindly Enter the Annual Revenue'));
        }
    }
    @istest private static void AfterInsertTest()
    {
        Account acc = New Account();
        acc.Name = 'kiran';
        acc.Type = 'Prospect';
        acc.AnnualRevenue = 908999;
        acc.Rating = 'Hot';
        acc.Industry = 'Education';
        insert acc;
        
        list<contact> accRelatedContact = [SELECT id FROM Contact WHERE AccountId =: acc.Id];
        
        system.assertequals(1,accRelatedContact.size());
        
        
    }
    @istest private static void AfterUpdateTest()
    {
        Account acc = New Account();
        acc.Name = 'kiran';
        acc.Type = 'Prospect';
        acc.AnnualRevenue = 908999;
        acc.Rating = 'Hot';
        acc.Industry = 'Education';
        insert acc;
        
        acc.Rating = 'Cold';
        update acc;
        
        list<case> calist = [SELECT Id FROM Case WHERE AccountId =: acc.id];
        
        system.assertequals(1,calist.size());
        
        Account acc1 = New Account();
        acc1.Name = 'kiran';
        acc1.Type = 'Prospect';
        acc1.AnnualRevenue = 908999;
        acc1.Rating = 'Hot';
        acc1.Industry = 'Education';
        insert acc1;
        
        Contact con = new Contact();
        con.firstName = 'Joe';
        con.lastName = 'Doe';
        con.Email = 'jng@gmail.com';
        con.accountId = acc1.id;
        Insert con;
        
        acc1.Phone = '8067868768';
        update acc1;
        
        contact getcon = [select ID, Phone FROM Contact WHERE Id=: con.Id];
        
        system.assertequals(acc1.Phone, getcon.Phone);
        
        Account acc2 = New Account();
        acc2.Name = 'kiran';
        acc2.Type = 'Prospect';
        acc2.AnnualRevenue = 908999;
        acc2.Rating = 'Hot';
        acc2.Industry = 'Education';
        insert acc2;
        
        opportunity opp = new opportunity();
        opp.Name = 'Testing opp';
        opp.StageName = 'Prospecting';
        opp.CloseDate = date.today();
        opp.AccountId = acc2.id;
        insert opp;
        system.debug(opp);
        
        acc2.AnnualRevenue = 9090876;
        
        update acc2;
        
        opportunity getopp = [SELECT Id, Amount FROM Opportunity where id = : opp.Id];
        
        system.assertequals(acc2.AnnualRevenue,getopp.Amount);
        
        
        
        
    }

}



