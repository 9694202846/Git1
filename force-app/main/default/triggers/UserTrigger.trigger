trigger UserTrigger on user (before update, before insert, after insert, after update) {

    if(trigger.IsBefore){

        if(trigger.isUpdate){
           // OutOfOfficeHelper.isBeforeUpdate(Trigger.new, Trigger.oldMap);
        }
    }

    if(trigger.IsAfter){
         if(trigger.isInsert){
           // OutOfOfficeHelper.isAfterInsert(Trigger.New);
        }
        if(trigger.isUpdate){
            OutOfOfficeHelper.isAfterUpdate(Trigger.new, Trigger.oldMap);
        }
    }

}