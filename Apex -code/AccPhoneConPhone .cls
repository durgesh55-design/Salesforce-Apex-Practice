public class AccountTriggerDemo {
    
//Account Phone Is update Automaticaly Contact Phone is Updated.

    public static void AfterUpdate(List<Account> NewList, Map<Id, Account> OldMap)
    {
        Map<Id, String> MapList = new Map<Id, String>();
        
        for(Account acc : NewList)
        {
            Account accOld = OldMap.get(acc.Id);
            
            if(accOld.Phone != acc.Phone)
            {
                MapList.put(acc.Id, acc.Phone);
            }
        }
        
        if(MapList.isEmpty())
        {
            return;
        }
        
        List<Contact> Conlist = [
            SELECT Id, Phone, AccountId
            FROM Contact
            WHERE AccountId IN :MapList.keySet()
        ];
        
        for(Contact con : Conlist)
        {
            con.Phone = MapList.get(con.AccountId);
        }
        
        if(!Conlist.isEmpty())
        {
            update Conlist;
        }
    }
}