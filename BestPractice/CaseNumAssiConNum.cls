public class CaseTriggerHandler
{
    //Create case related Contact Case number is Updated.

    public static void AfterInsertAfterUpdate(List<case>NewList)
    {
       map<id,string>MapList = new map<id,string>();
       for(Case ca : NewList)
       {
           if(ca.ContactId != null)
           {
          MapList.put(ca.ContactId, ca.CaseNumber);
           }
       }
        List<Contact> ConList = [SELECT Id,LastName FROM Contact WHERE Id IN :MapList.keySet()];
        
        for(Contact con : ConList)
        {
            con.Case_Number__c = MapList.get(con.id);
        }
        if(!ConList.isEmpty())
        {
            Update ConList;
        }
    }
}