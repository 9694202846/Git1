public with sharing class NotificationAuraCtrl {

    @AuraEnabled
    public static Notification__c getNotification(){

        Notification__c n = [SELECT Id,
                                Notification_Details__c,
                                Notification_Type__c,
                                Scroll_Text__c,
                                Scroll_Text_Velocity__c,
                                Short_Description__c,
                                Show_Details_on_Click__c
                            FROM Notification__c
                            WHERE Active__c = true AND 
                                Start_Date__c <= TODAY AND 
                                End_Date__c >= TODAY
                            LIMIT 1
                        ];
        return n;
    }    

}