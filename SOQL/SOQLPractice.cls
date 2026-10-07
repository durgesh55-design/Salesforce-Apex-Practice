public class SOQLPractice {

// This class demonstrates the use of SOQL queries to retrieve records from Salesforce objects.

    public static void getRecords() {

        // Get all Active Accounts
        List<Account> accList = [
            SELECT Id, Name, Type
            FROM Account
            WHERE Active__c = TRUE
        ];





dwedwaedsc c ,cc

dwd
wed
Dd
D
d
DD
D
D
Sad
ASD
Sd
sD
ASd
sD
asd
sDs










        // Get Contacts from Hyderabad
        List<Contact> conList = [
            SELECT Id, FirstName, LastName, Email, MailingCity
            FROM Contact
            WHERE MailingCity = 'Hyderabad'
        ];

        System.debug('Active Accounts: ' + accList);
        System.debug('Hyderabad Contacts: ' + conList);
    }
}


