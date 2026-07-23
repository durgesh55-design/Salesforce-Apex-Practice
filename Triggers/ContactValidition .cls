public class ContactTriggerHandler {

//This method is used to check the contact record count for a specific account before inserting or updating a contact. If the count exceeds 3, it will throw an error.

    public static void BeforeInsertBeforeUpdate(List<Contact>NewList)
    {
        Set<id> conset = new Set<id>();
        
        for(Contact con : NewList)
        {
            conset.add(con.id);
        }
        List<contact> conlist =[SELECT Id FROM Contact WHERE AccountId In : conset];
        
        for(Contact con1 : NewList)
        {
            integer i = conlist.size();
            
            if(i > 3)
            {
              con1.addError('Can not Create the contact since it is have 3 record  Account Connected');
            }
        }
    }
}