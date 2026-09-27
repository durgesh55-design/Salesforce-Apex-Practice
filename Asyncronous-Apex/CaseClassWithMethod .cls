public class CaseEmailNotification {

    //When a new Case record is created, a future method is called to send an email 
    //notification to the support team asynchronously. (Create a future method and call it in 
    //trigger with after insert event).
    
    @future
    public static void sendEmail(Set<Id> caseIds) {

        List<Case> caseList = [
            SELECT Id, CaseNumber, Subject, Status
            FROM Case
            WHERE Id IN :caseIds
        ];

        List<Messaging.SingleEmailMessage> emails =
            new List<Messaging.SingleEmailMessage>();

        for (Case cs : caseList) {

            Messaging.SingleEmailMessage email =
                new Messaging.SingleEmailMessage();

            email.setToAddresses(
                new String[] {'support@company.com'}
            );

            email.setSubject(
                'New Case Created: ' + cs.CaseNumber
            );

            email.setPlainTextBody(
                'A new Case has been created.' +
                '\nCase Number: ' + cs.CaseNumber +
                '\nSubject: ' + cs.Subject +
                '\nStatus: ' + cs.Status
            );

            emails.add(email);
        }

        if (!emails.isEmpty()) {
            Messaging.sendEmail(emails);
        }
    }
}w