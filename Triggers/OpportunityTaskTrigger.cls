trigger OpportunityTrigger on Opportunity (after insert, after update) {

    // List to hold Tasks to be created.

    List<Task> taskList = new List<Task>();

    for (Opportunity opp : Trigger.new) {

        // For new Opportunity, check if Stage is Prospecting
        if (Trigger.isInsert && opp.StageName == 'Prospecting') {

            Task t = new Task();
            t.Subject = 'Follow up on Opportunity';
            t.WhatId = opp.Id;
            t.OwnerId = opp.OwnerId;

            taskList.add(t);
        }

        // For existing Opportunity, check if Stage changed to Prospecting
        if (Trigger.isUpdate) {

            Opportunity oldOpp = Trigger.oldMap.get(opp.Id);

            if (oldOpp.StageName != 'Prospecting'
                && opp.StageName == 'Prospecting') {

                Task t = new Task();
                t.Subject = 'Follow up on Opportunity';
                t.WhatId = opp.Id;
                t.OwnerId = opp.OwnerId;

                taskList.add(t);
            }
        }
    }

    // Insert all Tasks in one DML operation
    if (!taskList.isEmpty()) {
        insert taskList;
    }
}