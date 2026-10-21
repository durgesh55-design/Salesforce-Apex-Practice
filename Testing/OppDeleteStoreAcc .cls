@isTest public class OppDeleteStoreAccTest 
{
    @isTest Private static void AfterDeleteTest()
    {
        // Create Account
        Account acc = new Account();
        acc.Name = 'Test Account';
        acc.Opportunity_Count__c = 2;
        insert acc;
        
        // Create two Opportunities
        List<Opportunity> oppList = new List<Opportunity>();
        
        for(Integer i = 1; i <= 2; i++)
        {
            Opportunity opp = new Opportunity();
            opp.Name = 'Testing ' + i;
            opp.AccountId = acc.Id;
            opp.CloseDate = Date.today();
            opp.StageName = 'Prospecting';
            
            oppList.add(opp);
        }
        
        insert oppList;
        
        Test.startTest();
        
        // Delete one Opportunity
        delete oppList[0];
        
        Test.stopTest();
        
        // Query updated Account
        Account updatedAcc = [
            SELECT Id, Opportunity_Count__c
            FROM Account
            WHERE Id = :acc.Id
        ];
        
        // One Opportunity should remain
        System.assertEquals(
            1,
            updatedAcc.Opportunity_Count__c,
            'Opportunity count should decrease to 1'
        );
    }
    
}