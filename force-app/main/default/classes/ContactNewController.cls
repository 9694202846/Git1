public class ContactNewController {
    @AuraEnabled
    Public static List<Contact> getContacts(Id accountId){
        List<contact> contactList =[Select Name,Phone,Email FROM Contact WHERE  AccountId =: accountId];
        return contactList;
        
    }
    @AuraEnabled
    Public static Contact getNewContacts(Contact con,Id AccountId){
       con.AccountId= AccountId;
        insert con;
        return con;
    }

}