trigger Contactcount1 on Contact (after delete, after insert, after update) {

     

        set<ID> AccountIds = new set<ID>();

        set<ID> conIDs = new Set<ID>();

        Set<Id> OldAId = new Set<Id>();

        

        if(trigger.isInsert){ 

            for(Contact c : trigger.new){

                if(c.AccountId!=null)

                AccountIds.add(c.AccountId);

            }

        }

      

        if(Trigger.isUpdate){   

            for(Contact opp : Trigger.new){        

                if(opp.AccountId != Trigger.oldMap.get(opp.id).AccountId){

                    AccountIds.add(opp.AccountId);

                    OldAId.add(Trigger.oldMap.get(opp.id).AccountId);

                }

            }

        }

     

        if(trigger.isDelete){

            for(Contact c : trigger.old){

                if(c.AccountId!=null)

                AccountIds.add(c.AccountId);

            }
        }
    }