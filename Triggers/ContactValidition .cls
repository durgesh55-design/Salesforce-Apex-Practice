public class ContactTriggerHandler {

    // This method checks the number of Contacts associated with an Account
    // before inserting or updating a Contact. If an Account already has
    // 3 Contacts, it prevents adding another Contact.
    
    public static void checkContactLimit(List<Contact> newList) {

        Set<Id> accountIds = new Set<Id>();

        // Collect Account Ids from incoming Contacts
        for (Contact con : newList) {
            if (con.AccountId != null) {
                accountIds.add(con.AccountId);
            }
        }

        // Count existing Contacts for each Account
        Map<Id, Integer> accountContactCount = new Map<Id, Integer>();

        for (AggregateResult ar : [
            SELECT AccountId accId, COUNT(Id) total
            FROM Contact
            WHERE AccountId IN :accountIds
            GROUP BY AccountId
        ]) {
            accountContactCount.put(
                (Id) ar.get('accId'),
                (Integer) ar.get('total')
            );
        }

        // Validate Contact limit
        for (Contact con : newList) {

            Integer count = accountContactCount.containsKey(con.AccountId)
                ? accountContactCount.get(con.AccountId)
                : 0;

            // Before Insert
            if (Trigger.isInsert && count >= 3) {
                con.addError('An Account cannot have more than 3 Contacts.');
            }

            // Before Update
            if (Trigger.isUpdate) {
                Contact oldCon = Trigger.oldMap.get(con.Id);

                // Check only if Account is changed
                if (oldCon.AccountId != con.AccountId && count >= 3) {
                    con.addError('An Account cannot have more than 3 Contacts.');
                }
            }
        }
    }
}