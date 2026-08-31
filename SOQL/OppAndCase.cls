public class SOQLPractice {

// Method to retrieve open opportunities and cases created this month

    public static void getRecords() {

        // Get Open Opportunities
        List<Opportunity> oppList = [
            SELECT Id, Name, StageName, Amount, CloseDate
            FROM Opportunity
            WHERE IsClosed = FALSE
        ];

        // Get Cases Created This Month
        List<Case> caseList = [
            SELECT Id, CaseNumber, Subject, Status, CreatedDate
            FROM Case
            WHERE CreatedDate = THIS_MONTH
        ];

        System.debug('Open Opportunities: ' + oppList);
        System.debug('Cases Created This Month: ' + caseList);
    }
}