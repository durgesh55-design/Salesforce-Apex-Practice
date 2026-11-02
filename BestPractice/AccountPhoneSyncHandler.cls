public class AccountPhoneSyncHandler 
{
    //Sync Account Phone with all Contacts and Leads having the same company.
    
    public static void syncPhone(List<Account> newList, Map<Id, Account> oldMap) 
    {
     
        Map<Id, String> accPhoneMap = new Map<Id, String>();
        
        Map<String, String> companyPhoneMap =new Map<String, String>();
        
        // Step 1: Find Accounts whose Phone changed
        for (Account acc : newList) 
        {
            
            Account oldAcc = oldMap.get(acc.Id);
            
            if (acc.Phone != oldAcc.Phone)
            {
                
                accPhoneMap.put(
                    acc.Id,
                    acc.Phone
                );
                
                if (acc.Name != null) 
                {
                    companyPhoneMap.put(
                        acc.Name,
                        acc.Phone
                    );
                }
            }
        }
        
        // Stop if no Account Phone changed
        if (accPhoneMap.isEmpty()) 
        {
            return;
        }
        
        // Step 2: Find related Contacts
        List<Contact> conList = [SELECT Id, Phone, AccountId FROM Contact WHERE AccountId IN :accPhoneMap.keySet()];
        
        // Step 3: Update Contact Phone
        for (Contact con : conList) 
        {
            
            String newPhone =
                accPhoneMap.get(con.AccountId);
            
            if (con.Phone != newPhone) 
            {
                con.Phone = newPhone;
            }
        }
        
        // Step 4: Find matching Leads
        List<Lead> leadList = [SELECT Id, Phone, Company FROM Lead WHERE Company IN :companyPhoneMap.keySet()];
        
        // Step 5: Update Lead Phone
        for (Lead ld : leadList) 
        {
            String newPhone =
                companyPhoneMap.get(ld.Company);
            
            if (ld.Phone != newPhone)
            {
                ld.Phone = newPhone;
            }
        }
        
        // Step 6: Update Contacts
        if (!conList.isEmpty()) 
        {
            update conList;
        }
        
        // Step 7: Update Leads
        if (!leadList.isEmpty())
        {
            update leadList;
        }
    }
}