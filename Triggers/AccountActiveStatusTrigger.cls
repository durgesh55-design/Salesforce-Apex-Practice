trigger AccountTrigger on Account (after update) {

    // Store Account IDs where Active changed from Yes to No
    
    Set<Id> accountIds = new Set<Id>();

    // Compare old and new Account values
    for (Account acc : Trigger.new) {
        Account oldAcc = Trigger.oldMap.get(acc.Id);

        // Check whether Active changed from Yes to No
        if (oldAcc.Active__c == 'Yes' && acc.Active__c == 'No') {
            accountIds.add(acc.Id);
        }
    }

    // Stop execution if no Account changed from Yes to No
    if (accountIds.isEmpty()) {
        return;
    }

    // Get all Opportunities related to the affected Accounts
    // Exclude Opportunities that are already Closed Won
    List<Opportunity> oppList = [
        SELECT Id, StageName
        FROM Opportunity
        WHERE AccountId IN :accountIds
        AND StageName != 'Closed Won'
    ];

    // Change the Stage of all eligible Opportunities to Closed Lost
    for (Opportunity opp : oppList) {
        opp.StageName = 'Closed Lost';
    }

    // Update Opportunities only when there are records to update
    if (!oppList.isEmpty()) {
        update oppList;
    }
}