trigger CaseTrigger on Case (before update, before insert, after insert, after update) {

    if(trigger.IsBefore){
 if(trigger.isInsert){
            CaseTriggerHelperP.subjectUpdate(Trigger.New);
        }
        if(trigger.isUpdate){
            //CaseTriggerHelperP.isBeforeUpdate(Trigger.new, Trigger.oldMap);
             CaseTriggerHelperP.subjectUpdate(Trigger.New);
        }
    }

    if(trigger.IsAfter){
         if(trigger.isInsert){
           // CaseTriggerHelperP.subjectUpdate(Trigger.New);
        }
        if(trigger.isUpdate){
            CaseTriggerHelperP.isAfterUpdate(Trigger.new, Trigger.oldMap);
            // CaseTriggerHelperP.subjectUpdate(Trigger.New);
        }
    }

}