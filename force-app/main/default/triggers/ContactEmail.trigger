trigger ContactEmail on contact (before insert,after update, after insert) {
   
   if (trigger.isBefore ) {
      // This condition will check for trigger events using isAfter and isUpdate
      // context variable
      ConatctemailHelper.emailHelper(Trigger.new);
      
      // Trigger calls the helper class and does not have any code in Trigger
      // and this will be called only when trigger ids after update
   }
}