trigger AccountTrigger on Account (after update) {

    Set<Id> accountIds = new Set<Id>();
    Map<Id, Id> accountOwnerMap = new Map<Id, Id>();

    // Find Accounts whose Owner has changed
    for (Account acc : Trigger.new) {

        Account oldAcc = Trigger.oldMap.get(acc.Id);

        if (acc.OwnerId != oldAcc.OwnerId) {
            accountIds.add(acc.Id);
            accountOwnerMap.put(acc.Id, acc.OwnerId);
        }
    }

    // Get related Contacts
    List<Contact> conList = [
        SELECT Id, AccountId, OwnerId
        FROM Contact
        WHERE AccountId IN :accountIds
    ];

    // Update Contact Owner
    for (Contact con : conList) {
        con.OwnerId = accountOwnerMap.get(con.AccountId);
    }

    if (!conList.isEmpty()) {
        update conList;
    }
}