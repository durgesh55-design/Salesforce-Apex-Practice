  public static void AfterUpdate(List<Contact>NewList)
    {
         Map<Id, String> conMap = new Map<Id, String>();
        
        for(Contact con : NewList)
        {
            if(con.Description != Null)
            {
                conMap.put(con.AccountId, con.Description);
            }
        }
        List<Account>accList =[SELECT Id , Description FROM Account WHERE Id IN : conMap.keyset()];
        
       for(Account acc : accList)
       {
           acc.Description = conMap.get(acc.Id);
       }
        if(!accList.isEmpty())
        {
            Update acclist;
        }
    }
}