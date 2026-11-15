public class AccountRatingNotification {

    public static void sendNotification(Set<Id> accountIds) {

        // Get Custom Notification Type
        CustomNotificationType notificationType = [
            SELECT Id
            FROM CustomNotificationType
            WHERE DeveloperName = 'Account_Rating_Notification'
            LIMIT 1
        ];

        // Create notification
        Messaging.CustomNotification notification =
            new Messaging.CustomNotification();

        notification.setTitle('Account Rating Changed');

        notification.setBody(
            'The Rating of an Account has been changed.'
        );

        notification.setNotificationTypeId(notificationType.Id);

        // Send notification to Account Owner
        for (Id accountId : accountIds) {

            Account acc = [
                SELECT Id, OwnerId, Name, Rating
                FROM Account
                WHERE Id = :accountId
            ];

            notification.setTargetId(acc.Id);

            notification.send(
                new Set<String>{ String.valueOf(acc.OwnerId) }
            );
        }
    }
}
