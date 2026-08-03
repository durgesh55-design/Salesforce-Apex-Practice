public class ContactTriggerHandler {

    public static void preventDuplicateEmail(List<Contact> newList) {

        Set<String> emailSet = new Set<String>();

        // 1. New/Updated Contacts ke Email collect karo
        for (Contact con : newList) {
            
            if (String.isNotBlank(con.Email)) {
                emailSet.add(con.Email.trim().toLowerCase());
            }
        }

        if (emailSet.isEmpty()) {
            return;
        }

        // 2. Existing Contacts find karo
        Map<String, Id> existingEmailMap = new Map<String, Id>();

        for (Contact con : [
            SELECT Id, Email
            FROM Contact
            WHERE Email IN :emailSet
        ]) {
            existingEmailMap.put(con.Email.trim().toLowerCase(), con.Id);
        }

        // 3. Duplicate check
        for (Contact con : newList) {

            if (String.isBlank(con.Email)) {
                continue;
            }

            String email = con.Email.trim().toLowerCase();

            if (existingEmailMap.containsKey(email)) {

                // Update ke time same record ko duplicate mat samjho
                if (existingEmailMap.get(email) != con.Id) {
                    con.addError(
                        'A Contact with this Email already exists.'
                    );
                }
            }
        }
    }
}