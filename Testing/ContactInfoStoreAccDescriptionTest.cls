
@isTest
public class ContactInfoStoreAccDescriptionTest {

    // Test method to verify that contact names are correctly stored in the Account Description field
    @isTest
    static void testContactNamesInAccountDescription() {

        // Step 1: Create Account
        Account acc = new Account(
            Name = 'Test Company'
        );
        insert acc;

        // Step 2: Create multiple Contacts
        List<Contact> conList = new List<Contact>();

        conList.add(new Contact(
            FirstName = 'Rahul',
            LastName = 'Sharma',
            AccountId = acc.Id
        ));

        conList.add(new Contact(
            FirstName = 'Priya',
            LastName = 'Patil',
            AccountId = acc.Id
        ));

        Test.startTest();
        insert conList;
        Test.stopTest();

        // Step 3: Query updated Account
        Account updatedAcc = [
            SELECT Id, Description
            FROM Account
            WHERE Id = :acc.Id
        ];

        // Step 4: Verify results
        System.assertNotEquals(
            null,
            updatedAcc.Description,
            'Account Description should not be null'
        );

        System.assert(
            updatedAcc.Description.contains('Rahul Sharma'),
            'Description should contain Rahul Sharma'
        );

        System.assert(
            updatedAcc.Description.contains('Priya Patil'),
            'Description should contain Priya Patil'
        );
    }
}
