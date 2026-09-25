trigger PositionTrigger on Position__c (before insert) {

    for (Position__c pos : Trigger.new) {

        if (pos.Open_Date__c == null) {
            pos.Open_Date__c = Date.today();
        }

        if (pos.Min_Pay__c == null) {
            pos.Min_Pay__c = 10000;
        }

        if (pos.Max_Pay__c == null) {
            pos.Max_Pay__c = 15000;
        }
    }
}