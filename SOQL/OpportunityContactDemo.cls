public class OpportunityContactDemo {

    public static void getData() {

        // 1. Opportunities closing this quarter
        List<Opportunity> oppList = [
            SELECT Id, Name, CloseDate, StageName
            FROM Opportunity
            WHERE CloseDate = THIS_QUARTER
        ];

        System.debug('Opportunities: ' + oppList);


        // 2. Contacts with related Account
        List<Contact> conList = [
            SELECT Id, FirstName, LastName, Email,
                   Account.Id, Account.Name
            FROM Contact
            WHERE AccountId != NULL
        ];

        System.debug('Contacts: ' + conList);
    }
}