trigger sendemail on Contact (after insert) {
if(trigger.isInsert){
Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
String emailAddr = [SELECT Email FROM Contact where Id = :trigger.new[0].Id].Email;
String newName = [SELECT Name FROM Contact where Id = :trigger.new[0].Id].Name;
String[] toAddresses = new String[] {emailAddr} ;
mail.setToAddresses(toAddresses);
mail.Setsubject('Your account has been successfully created ' + newName);
mail.SetplainTextBody('Name of the customer ' + newName);
Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
}
        
    }