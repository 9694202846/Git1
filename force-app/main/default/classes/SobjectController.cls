public class SobjectController {
@AuraEnabled
    public static List<Account> getaccount() {
        
        return [select id from Account];
    }
}