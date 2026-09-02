public class AccountLeadController {

    // Method to retrieve Accounts with Annual Revenue greater than 1 million and Leads created in the last 7 days

    public static void getAccountsAndLeads() {

        // Get Accounts with Annual Revenue greater than 1 million
        List<Account> accounts = [
            SELECT Id, Name, AnnualRevenue
            FROM Account
            WHERE AnnualRevenue > 1000000
        ];

        System.debug('Accounts with Revenue > 1 Million: ' + accounts);


        // Get Leads created in the last 7 days
        List<Lead> leads = [
            SELECT Id, FirstName, LastName, Company, CreatedDate
            FROM Lead
            WHERE CreatedDate = LAST_N_DAYS:7
        ];

        System.debug('Leads created in last 7 days: ' + leads);
    }
}