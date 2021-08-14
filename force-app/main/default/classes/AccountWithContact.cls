public class AccountWithContact {
    @AuraEnabled
    public static List<account> getAccounts(){
        return[select id,Name from account ];
    }
    @AuraEnabled
    public static List<contact> getContacts(Id accid){
        return[SELECT Id, Name FROM Contact where accountid=:accid];
    }
}