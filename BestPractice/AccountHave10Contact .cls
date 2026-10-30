public class AccountHave10Contact
{
 //If Account has more than 10 Contacts, show an error on inserting the 11th Contact.

    public static void BeforeInsert(List<Contact>NewList)
    {
        Set<Id>AccId = new Set<Id>();
        for(Contact con : NewList)
        {
            if(con.AccountId != Null)
            {
            AccId.add(con.AccountId);
            }
        }
        
        List<AggregateResult>Result = [SELECT AccountId, COUNT(Id) Idset FROM Contact WHERE Id IN : AccId GROUP BY AccountId];
        
        Map<Id ,Integer>MapList = new Map<Id ,Integer>();
        for(AggregateResult Ar : Result)
        {
            Id Ids = (Id) Ar.get('AccountId');
            Integer va = (Integer) Ar.get('Idset');
            
            MapList.put(Ids ,va);
            
            for(Contact con1 : NewList)
            {
                Integer Count  =  MapList.ContainsKey(con1.AccountId) ? MapList.get(con1.AccountId) : 0;
                
                if( Count >= 10)
                {
                    con1.addError('Account already has 10 Contacts. Cannot create another Contact.');
                }
            }
           
            
        }
       
    }
}