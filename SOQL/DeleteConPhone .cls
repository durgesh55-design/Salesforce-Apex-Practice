// This is a simple class to delete the contact records which have null phone number.

public class DeleteContact
 {

public static void method()
{
   List<Contact> conlist = [SELECT Id,Phone ,Email FROM Contact WHERE Phone = Null];
    
   Delete conlist;
}
    
}