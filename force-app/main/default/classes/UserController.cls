public class UserController {
    @AuraEnabled
    public static List<User> getUserList(){
        return  [select Id, Name, Email from User];
         
        
        
    }

}