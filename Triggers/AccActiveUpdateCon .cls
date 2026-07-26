 public static void AfterUpdate( List<Account> NewList)
    {
        Set<Id>accSet = new Set<Id>();
        for(Account acc : NewList)
        {
            if(acc.Active__c == 'Yes')
            {
               accSet.add(acc.Id);
            }
        }
        List<Contact> acclist =[SELECT Id FROM Contact WHERE AccountId IN : accSet];
        
        for(Contact con : acclist)
        {
            con.LeadSource = 'Web';
        }
        Update acclist;
    }