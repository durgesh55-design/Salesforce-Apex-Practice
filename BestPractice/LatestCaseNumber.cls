public class CaseTriggerHandler {

    public static void afterInsert(List<Case> newCases) {

        Set<Id> accountIds = new Set<Id>();

        // Collect Account Ids
        for (Case cs : newCases) {
            if (cs.AccountId != null) {
                accountIds.add(cs.AccountId);
            }
        }

        if (accountIds.isEmpty()) {
            return;
        }

        // Get latest Case for each Account
        List<Case> caseList = [
            SELECT Id, CaseNumber, AccountId, CreatedDate
            FROM Case
            WHERE AccountId IN :accountIds
            ORDER BY CreatedDate DESC
        ];

        Map<Id, String> latestCaseMap = new Map<Id, String>();

        for (Case cs : caseList) {

            if (!latestCaseMap.containsKey(cs.AccountId)) {
                latestCaseMap.put(cs.AccountId, cs.CaseNumber);
            }
        }

        // Update Accounts
        List<Account> accountsToUpdate = new List<Account>();

        for (Id accountId : latestCaseMap.keySet()) {

            Account acc = new Account();
            acc.Id = accountId;
            acc.Latest_Case_Number__c = latestCaseMap.get(accountId);

            accountsToUpdate.add(acc);
        }

        if (!accountsToUpdate.isEmpty()) {
            update accountsToUpdate;
        }
    }
}