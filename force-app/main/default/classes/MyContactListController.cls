public class MyContactListController {
@AuraEnabled
public static List<Contact> getContacts(Id recordId) {
    return [Select Id, Name, Email, Title, Phone From Contact];
}
}