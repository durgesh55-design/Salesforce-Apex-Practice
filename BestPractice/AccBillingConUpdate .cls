public class AccBillingChangeConUpdate 
{
    //Update Contact Mailing Address whenever Account Billing Address changes.
    
    public static void AfterUpdate(List<Account>NewList, map<id,Account>oldmap)
    {
        Map<Id,Account>Idset = new Map<Id,Account>();
        for(Account acc : NewList)
        {
            Account oldAcc = oldmap.get(acc.id);
            if(acc.BillingAddress != oldAcc.BillingAddress)
            {
                Idset.put(acc.id, acc);
            }
        }
          if(!Idset.IsEmpty())
        {
            Return;
        }
        
        List<Contact>conlist=[SELECT Id FROM Contact WHERE AccountId IN : Idset.keyset()];
                
        for(Contact con : conlist)
        {
			Account acc1 = Idset.get(con.AccountId);
        }
        if(!conlist.IsEmpty())
        {
            Update conlist;
        }     
    }
    
}