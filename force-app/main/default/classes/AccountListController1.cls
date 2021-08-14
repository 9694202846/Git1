public class AccountListController1 {
    
    public static List<account> fetchAccount(Id recordId){
        
        return [SELECT Id, Name, Industry, Type FROM Account LIMIT 10];
        
        
    }

}