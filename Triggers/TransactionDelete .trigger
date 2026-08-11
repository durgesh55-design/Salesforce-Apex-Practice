trigger TransactionTrigger on Transaction__c (before delete) {
 
    Set<Id> bankIds = new Set<Id>();

    for (Transaction__c tran : Trigger.old) {
        if (tran.Bank__c != null) {
            bankIds.add(tran.Bank__c);
        }
    }

    Map<Id, Bank__c> banks = new Map<Id, Bank__c>(
        [SELECT Id, Name FROM Bank__c WHERE Id IN :bankIds]
    );

    for (Transaction__c tran : Trigger.old) {
        if (tran.Bank__c != null) {
            tran.addError(
                'You cannot delete this Transaction because it is connected to Bank: '
                + banks.get(tran.Bank__c).Name
            );
        }
    }
}