public class CaseTriggerHandler {
    // This method updates the Latest_Case_Number__c field on the Account object whenever a Case is inserted or updated.

    public static void updateLatestCaseNumber(List<Case> caseList) {

        Map<Id, String> accountCaseMap = new Map<Id, String>();

        for (Case cs : caseList) {

            if (cs.AccountId != null) {
                accountCaseMap.put(cs.AccountId, cs.CaseNumber);
            }
        }

        if (accountCaseMap.isEmpty()) {
            return;
        }

        List<Account> accountList = new List<Account>();

        for (Account acc : [
            SELECT Id, Latest_Case_Number__c
            FROM Account
            WHERE Id IN :accountCaseMap.keySet()
        ]) {

            acc.Latest_Case_Number__c = accountCaseMap.get(acc.Id);
            accountList.add(acc);
        }

        if (!accountList.isEmpty()) {
            update accountList;
        }
    }
}