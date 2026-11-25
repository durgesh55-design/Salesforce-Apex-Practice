
@isTest
public class AccountTriggerTest {

    @isTest
    static void testContactOwnerUpdate() {

        // Create first User
        Profile p = [SELECT Id FROM Profile WHERE Name = 'Standard User' LIMIT 1];

        User user1 = new User(
            FirstName = 'Test',
            LastName = 'User1',
            Alias = 'tuser1',
            Email = 'testuser1@example.com',
            Username = 'testuser1' + System.currentTimeMillis() + '@example.com',
            ProfileId = p.Id,
            TimeZoneSidKey = 'Asia/Kolkata',
            LocaleSidKey = 'en_US',
            EmailEncodingKey = 'UTF-8',
            LanguageLocaleKey = 'en_US'
        );
        insert user1;

        // Create second User
        User user2 = new User(
            FirstName = 'Test',
            LastName = 'User2',
            Alias = 'tuser2',
            Email = 'testuser2@example.com',
            Username = 'testuser2' + System.currentTimeMillis() + '@example.com',
            ProfileId = p.Id,
            TimeZoneSidKey = 'Asia/Kolkata',
            LocaleSidKey = 'en_US',
            EmailEncodingKey = 'UTF-8',
            LanguageLocaleKey = 'en_US'
        );
        insert user2;

        // Create Account
        Account acc = new Account(
            Name = 'Test Account',
            OwnerId = user1.Id
        );
        insert acc;

        // Create Contact
        Contact con = new Contact(
            LastName = 'Test Contact',
            AccountId = acc.Id,
            OwnerId = user1.Id
        );
        insert con;

        // Change Account Owner
        Test.startTest();

        acc.OwnerId = user2.Id;
        update acc;

        Test.stopTest();

        // Verify Contact Owner changed
        Contact updatedCon = [
            SELECT Id, OwnerId
            FROM Contact
            WHERE Id = :con.Id
        ];

        System.assertEquals(
            user2.Id,
            updatedCon.OwnerId,
            'Contact Owner should match the new Account Owner'
        );
    }
}
