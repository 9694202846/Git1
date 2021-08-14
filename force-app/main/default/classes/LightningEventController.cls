public class LightningEventController {
    @AuraEnabled
    Public static List< Event > getEventsList  (string queryCondition) {
        system.debug('methodCalled'+queryCondition);
     String MYTODAY = 'MY TODAY';
     String MY_OVERDUE = 'MY OVERDUE';
     String MY_UPCOMING = 'MY UPCOMING';
     String MY_COMPLETED = 'MY COMPLETED';
            String query = 'SELECT Id,Subject,ActivityDate,What.Name,WhatId FROM EVENT WHERE ';
            
            if (MYTODAY == queryCondition) {
                query = query + 'ActivityDate = Today';
            } else if (MY_UPCOMING == queryCondition) {
                query = query + 'ActivityDate > Today';
            } else if (MY_COMPLETED == queryCondition) {
               query = query + 'Subject = Eevnt';
            } else if (MY_OVERDUE == queryCondition) {
                 query = query + 'ActivityDate < Today';
            }
            
            query = query + ' AND OwnerId = \'' + Userinfo.getUserId() + '\' ' + ' ORDER BY CreatedDate DESC ';
        system.debug(query +'query');
            return Database.Query(query);
            
        
        
    }

}