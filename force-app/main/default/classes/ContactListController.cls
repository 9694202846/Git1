public class ContactListController {
    @AuraEnabled
    public static List<Contact> getContactList(){
        
        return[Select id,Name,Email,Title from Contact];
        
    }

}