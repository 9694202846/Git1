public class OutOfOfficeHelper {
    public static void isAfterUpdate(List<User> users,Map<Id, user> oldusers) {   
        Set<Id> userIds = new Set<Id>();
        for(User ouser : users){
            if(ouser.payal09__Deputy_during_Out_of_Office__c!= null && oldusers.get(ouser.Id).payal09__Deputy_during_Out_of_Office__c != ouser.payal09__Deputy_during_Out_of_Office__c  ){
                userIds.add(ouser.Id);
                system.debug('userIds'+userIds);
            }
        }
        
        List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
        for(OutOfOffice ooo : [SELECT StartDate, EndDate, Message, User.Name, User.payal09__Deputy_during_Out_of_Office__r.Name, User.payal09__Deputy_during_Out_of_Office__c  FROM OutOfOffice WHERE UserId =: userIds]){
            system.debug('ooo'+ooo);
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            
            List<Id> sendTo = new List<Id>();
            sendTo.add(ooo.User.payal09__Deputy_during_Out_of_Office__c);
            mail.setTargetObjectId(ooo.User.payal09__Deputy_during_Out_of_Office__c);
            //mail.setReplyTo('sirdavid@bankofnigeria.com');
            mail.setSenderDisplayName(ooo.User.Name);
            mail.setSubject('OUT OF OFFICE');
            
            String body = 'Dear ' + ooo.User.Name + ', ';
            body += 'I confess this will come as a surprise to you.';
            body += 'I am John Alliston CEO of the Bank of Nigeria.';
            body += 'I write to request your cooperation in this ';
            body += 'urgent matter as I need a foreign partner ';
            body += 'in the assistance of transferring $47,110,000 ';
            body += 'to a US bank account. Please respond with ';
            body += 'your bank account # so I may deposit these funds.';
            mail.setHtmlBody(body);
            
            mails.add(mail);
            system.debug('mails'+mails);
        }
    
    Messaging.sendEmail(mails);
    
}


}