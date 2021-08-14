trigger TaskEmail on Task (after insert) {
  if(trigger.isInsert ){
           Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
String emailAddr = [SELECT Email FROM User where Id = :trigger.new[0].Id].Email;
String newName = [SELECT Name FROM User where Id = :trigger.new[0].Id].Name;
String[] toAddresses = new String[] {emailAddr} ;
mail.setToAddresses(toAddresses);
mail.Setsubject('Your Task has been successfully created ' + newName);
mail.SetplainTextBody('Name of the customer ' + newName);
Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
          
     
            }
        }