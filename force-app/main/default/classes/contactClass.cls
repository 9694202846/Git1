public class contactClass {
    @AuraEnabled
    public static List<Contact> getContact(){
        
        return[Select id,Name,FirstName, LastName, Email, Phone from Contact];
    }

}