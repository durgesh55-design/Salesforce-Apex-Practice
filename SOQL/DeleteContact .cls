public class DeleteContact 
{
    //If Phone is Empty Then check all Contact is Deleted.
	public static void DeleteMethod()
    {
        List<Contact> Conlist = [SELECT Id, LastName, FirstName, Phone, Email FROM Contact WHERE Phone = Null];
        Delete ConList;
    }
}