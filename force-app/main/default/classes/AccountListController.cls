public class AccountListController {
     @AuraEnabled 
    public static List < Account > fetchAccts() {  
          
        return [ SELECT Id, Name,payal09__Account_Score_Test__c , Industry, Type FROM Account LIMIT 10  ];  
          
    }  
  /*  public static List<accountListWrapper> fetchAccountWrapper(){     
        List<accountListWrapper> lstaccountListWrapper = new List<accountListWrapper>();
        // query account records and create 'accountListWrapper' class instance for each record. 
        for(Account acc : [SELECT Id, Name,payal09__Account_Score_Test__c , Industry, Type FROM Account LIMIT 10]){
                               // by default checkbox should be false 
                               lstaccountListWrapper.add(new accountListWrapper(false,acc));
                           } 
        // return the 'lstaccountListWrapper' list 
        return lstaccountListWrapper; 
    }
    

    public class accountListWrapper {
        @AuraEnabled public boolean isChecked {get;set;}
        @AuraEnabled public  account objAccount{get;set;}
        public accountListWrapper(boolean isChecked, account objAccount){
            this.isChecked = isChecked;
            this.objAccount = objAccount;
        }
    }
    
    @AuraEnabled
    public static List<accountListWrapper> fetchAccts() {
        List<accountListWrapper> lstaccountListWrapper = new List<accountListWrapper>();
       // List<Account> acclist = [ SELECT Id, Name,payal09__Account_Score_Test__c , Industry, Type FROM Account LIMIT 10 ];
       // List<Account> accountData = new  List<Account>();
       // accountData = Database.query('SELECT Id, Name,payal09__Account_Score_Test__c , Industry, Type FROM Account'+ 'LIMIT'+' '+recordLimit);
       // MyaccountList.accounts =accountData;
        // MyaccountList.accountSize=acclist.size();

       // return churnAccounts; 
       // 
       // 
       for(Account acc : [SELECT Id, Name,payal09__Account_Score_Test__c , Industry, Type FROM Account LIMIT 10]){
                               // by default checkbox should be false 
                               lstaccountListWrapper.add(new accountListWrapper(acc));
                           } 
        // return the 'lstaccountListWrapper' list 
        return lstaccountListWrapper; 
    }
    
    }*/
    
}