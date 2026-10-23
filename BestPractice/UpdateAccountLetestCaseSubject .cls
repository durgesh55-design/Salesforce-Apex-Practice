public class UpdateAccountLetestCaseSubject 
{
	//Update Account with the latest Case Subject.
	
    public static void AfterInsert(List<Case>NewList)
    {
        Set<Id>IdList = New Set<Id>();
        for(Case ca : NewList)
        {
            if(ca.AccountId != Null && ca.Subject != Null)
            {
                IdList.add(ca.AccountId);
            }
        }
        List<Account>accList = [SELECT Id,(Select Id , Subject FROM Cases ORDER BY CreatedDate DESC, Id DESC
                 LIMIT 1) FROM Account WHERE Id IN : IdList ];
        
        for(Account acc : accList)
        {
           for(Case ca1 : acc.cases) 
           {
               acc.Latest_Case_Subject__c=ca1.subject;
           }
        }
        Update accList;
    }
}