trigger SendEmailuser on User (after insert, after update) {
   
      /*  set<id> userId = new set<id>();
 
  // Step 0: Create a master list to hold the emails we'll send
  List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
 
  for (User myUser : Trigger.new) {
    
    if (myUser.payal09__Deputy_during_Out_of_Office__c  != null )
    {
          userId.add(myUser.payal09__Deputy_during_Out_of_Office__c);
        System.debug('userId'+userId);
    }
         User ouser = [Select firstname,lastname,email,id,name from user where id in :userId];
      System.debug('ouser'+ouser);
      // Step 1: Create a new Email
      Messaging.SingleEmailMessage mail =  new Messaging.SingleEmailMessage();
   
      // Step 2: Set list of people who should get the email
      List<String> sendTo = new List<String>();
      sendTo.add(ouser.email);
      mail.setToAddresses(sendTo);
   
      // Step 3: Set who the email is sent from
      mail.setReplyTo('goyal.payal09@gmail.com');
      mail.setSenderDisplayName('Utz patil');
   
      // (Optional) Set list of people who should be CC'ed
      List<String> ccTo = new List<String>();
      ccTo.add('puja.patil@aress.com');
      mail.setCcAddresses(ccTo);
 
      // Step 4. Set email contents - you can use variables!
      mail.setSubject('URGENT BUSINESS PROPOSAL');
      String body = 'Dear ' + ouser.FirstName;
     
      mail.setHtmlBody(body);
   
      // Step 5. Add your email to the master list
      mails.add(mail);
        Messaging.sendEmail(mails);
    }*/
  }
  // Step 6: Send all emails in the master list