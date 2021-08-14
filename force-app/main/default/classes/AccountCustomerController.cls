public class AccountCustomerController {
    
@AuraEnabled
    
    public static Boolean getAccountType(Id recordId) {
        Boolean accountType;
        Account acc =  [select id,Type from Account where Type='Customer' AND ID=:recordId];
        if(acc.id != null){
            
            accountType= True; 
            
        }
        else{
             accountType= false; 
        }
        return accountType;
    }  



}