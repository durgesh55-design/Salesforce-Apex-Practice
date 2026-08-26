trigger PositionTrigger on Position__c (before insert) {

    // Loop through each Position record in the trigger context.

    for (Position__c pos : Trigger.new) {

        // Check if this is a New Position
        if (pos.New_Position__c == true) {

            // Populate Open Date if it is blank
            if (pos.Open_Date__c == null) {
                pos.Open_Date__c = Date.today();
            }

            // Populate Minimum Pay if it is blank
            if (pos.Min_Pay__c == null) {
                pos.Min_Pay__c = 10000;
            }

            // Populate Maximum Pay if it is blank
            if (pos.Max_Pay__c == null) {
                pos.Max_Pay__c = 15000;
            }
        }
    }
}