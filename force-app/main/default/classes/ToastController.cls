public with sharing class ToastController {
    @AuraEnabled
    public static void toastShowDone(String objId) {
        try
        {
            Schema.SObjectType token = Id.valueOf(objId).getSObjectType();
            Schema.DescribeSObjectResult dr = token.getDescribe();
            String queryString = 'SELECT ToastShown__c FROM ' + dr.getName() + ' WHERE Id= :objId' ;
            sObject[] objDBList = Database.query(queryString);    
            for(Integer i=0;i<objDBList.size();i++) {
                objDBList[i].put('ToastShown__c', true);
            }        
            Database.SaveResult[] srList = Database.update(objDBList, false);
            for(Database.SaveResult sr : srList) {
                if (sr.isSuccess()) {
                    System.debug('Updated successfully for ' + 
                                 dr.getName() + ' ID ' + sr.getId());
                }
                else {
                    System.debug('Updating ' + dr.getName() + ' returned the following errors.');
                    for(Database.Error e : sr.getErrors()) {
                        System.debug(e.getMessage());
                    }
                } 
            }
        } 
        catch(Exception ex)
        {
            throw new AuraHandledException(ex.getMessage());
        }
    }
}