public class UpdateEmptyContact
{
   // even if the contact is empty it will update the default phone number(9999999999)
   public static void UpdateContact()
   {
    List<Contact>contactList = [SELECT Id, Email, Phone FROM Contact WHERE Email = Null];
    
    for(integer i=0; i< contactList.size(); i++)
    {
        contactList[i].Phone = '9999999999';
    }
    update contactList;

   }
}