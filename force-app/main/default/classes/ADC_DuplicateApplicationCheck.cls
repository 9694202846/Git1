/**
* @author Payal Agrawal
* @date 28/06/2018
*
* @group CandidateMangemnt
* 
*
* @description This class is to create duplicate carrierSupportEntry when trigger with help of trigger handler  
*/
public class ADC_DuplicateApplicationCheck {
  /*  public static boolean triggerdisabled(){
        
        return TriggerSetting__c.getInstance().ADC_CareerSupportEntry_Disable__c;
    }
    
    
    public static boolean dateCheck (List<ADC_CareerSupportEntry__c> Cselist){
        //checking trigger by pass
        if(triggerdisabled())
            return false;
        String errorLabel = System.Label.ADC_CarrierSupportEntry_Message;
        set<id> cseId = new set<id>();
        set<id> Errorstop = new set<id>();
        set<Id> CareersupportId= new set<Id>();
        set<Id> CandidateNameId= new set<Id>();
        map<id,string> map1 = new map<id,string>();
        set<string> stringParentChd = new set<string>();
        set<string> Triggersetcheck = new set<string>();
        
        
        for(ADC_CareerSupportEntry__c cse : Cselist){
            
            
            cseId.add(cse.id);
            CareersupportId.add(cse.ADC_CareerSupportEntryTrainingName__c);
            CandidateNameId.add(cse.ADC_CareerSupportEntryContact__c);
            
            if(Triggersetcheck.contains(string.valueof(cse.ADC_CareerSupportEntryTrainingName__c)+string.valueof(cse.ADC_CareerSupportEntryContact__c)))
            {
                cse.adderror(errorLabel);
            }
            Triggersetcheck.add(string.valueof(cse.ADC_CareerSupportEntryTrainingName__c)+string.valueof(cse.ADC_CareerSupportEntryContact__c));
        }
        
        
        Map<Id,ADC_CareerSupport__c> mapCarrierSupport = new Map<Id,ADC_CareerSupport__c>([Select Id, ADC_CareerSupportEventDate__c, ADC_CareerSupportEndDate__c 
                                                                                           From ADC_CareerSupport__c 
                                                                                           Where Id =:CareersupportId 
                                                                                          ]);
        system.debug('mapCarrierSupport ++++++'+mapCarrierSupport );
        List<ADC_CareerSupportEntry__c > entries = [Select ADC_CareerSupportEntryContact__c, ADC_CareerSupportEntryTrainingName__r.ADC_CareerSupportEventDate__c,  ADC_CareerSupportEntryTrainingName__r.ADC_CareerSupportEndDate__c 
                                                    From ADC_CareerSupportEntry__c 
                                                    Where ADC_CareerSupportEntryContact__c=: CandidateNameId AND ID !=:cseId AND ADC_CareerSupportEntryCancelStatus__c = null
                                                   ];
        System.debug('entries+++'+entries);
        Map<Id, List<ADC_CareerSupportEntry__c >> mapEntries = new Map<Id, List<ADC_CareerSupportEntry__c >>();
        
        for(ADC_CareerSupportEntry__c  cse : entries){
            if(mapEntries.containsKey(cse.ADC_CareerSupportEntryContact__c)){
                List<ADC_CareerSupportEntry__c> MapCseList = mapEntries.get(cse.ADC_CareerSupportEntryContact__c);
                mapEntries.put(cse.ADC_CareerSupportEntryContact__c, MapCseList);
            }
            else{
                List<ADC_CareerSupportEntry__c> MapCseList = new List<ADC_CareerSupportEntry__c>();
                MapCseList.add(cse);
                mapEntries.put(cse.ADC_CareerSupportEntryContact__c, MapCseList);
            }
        }
          system.debug(mapEntries+'mapEntries');
        
        
        list<ADC_CareerSupportEntry__c> dbEntry = [select id, ADC_CareerSupportEntryTrainingName__c, ADC_CareerSupportEntryContact__c 
                                                   from ADC_CareerSupportEntry__c 
                                                   where  ADC_CareerSupportEntryTrainingName__c IN: CareersupportId AND ADC_CareerSupportEntryContact__c IN: CandidateNameId AND ADC_CareerSupportEntryCancelStatus__c= null];
        
        
        for(ADC_CareerSupportEntry__c  cse : dbEntry ){
            
            stringParentChd.add(string.valueof(cse.ADC_CareerSupportEntryTrainingName__c)+string.valueof(cse.ADC_CareerSupportEntryContact__c));
            map1.put(cse.id,string.valueof(cse.ADC_CareerSupportEntryTrainingName__c)+string.valueof(cse.ADC_CareerSupportEntryContact__c));
        } 
        
        
        
        for(ADC_CareerSupportEntry__c cse : Cselist){
            

            if(map1.containskey(cse.id) && map1.get(cse.id) != string.valueof(cse.ADC_CareerSupportEntryTrainingName__c)+string.valueof(cse.ADC_CareerSupportEntryContact__c) && stringParentChd.contains(string.valueof(cse.ADC_CareerSupportEntryTrainingName__c)+string.valueof(cse.ADC_CareerSupportEntryContact__c))  )
            {
                cse.adderror(errorLabel);
                Errorstop.add(cse.ADC_CareerSupportEntryContact__c  );
                
            }
            if(!map1.containskey(cse.id) && stringParentChd.contains(string.valueof(cse.ADC_CareerSupportEntryTrainingName__c)+string.valueof(cse.ADC_CareerSupportEntryContact__c)) )
            {
                
                
                cse.adderror(errorLabel);
                Errorstop.add(cse.ADC_CareerSupportEntryContact__c  );
            }
            
           
            
            if(mapEntries.containsKey(cse.ADC_CareerSupportEntryContact__c)){
                
                for(ADC_CareerSupportEntry__c c : mapEntries.get(cse.ADC_CareerSupportEntryContact__c)){
                    
                    if((!Errorstop.contains(c.ADC_CareerSupportEntryContact__c))&& ((c.ADC_CareerSupportEntryTrainingName__r.ADC_CareerSupportEventDate__c >= mapCarrierSupport.get(cse.ADC_CareerSupportEntryTrainingName__c).ADC_CareerSupportEventDate__c && c.ADC_CareerSupportEntryTrainingName__r.ADC_CareerSupportEventDate__c < mapCarrierSupport.get(cse.ADC_CareerSupportEntryTrainingName__c).ADC_CareerSupportEndDate__c) || 
                                                                                    (c.ADC_CareerSupportEntryTrainingName__r.ADC_CareerSupportEndDate__c > mapCarrierSupport.get(cse.ADC_CareerSupportEntryTrainingName__c).ADC_CareerSupportEventDate__c && c.ADC_CareerSupportEntryTrainingName__r.ADC_CareerSupportEndDate__c <= mapCarrierSupport.get(cse.ADC_CareerSupportEntryTrainingName__c).ADC_CareerSupportEndDate__c))){
                                                                                     
                      cse.adderror('error1') ;
                                                                                    
                      }
                }
            }
            
           
        }
        
        return true;
    }
    
    
     public static void Application_Upper_Limit_Check (List<ADC_CareerSupportEntry__c> careerSupportEntrySObjectList){      
       
        Set<Id> cseIdSet = new Set<Id>();
        for(ADC_CareerSupportEntry__c cseentry : careerSupportEntrySObjectList) {
            cseIdSet.add(cseentry.ADC_CareerSupportEntryTrainingName__c);   
        }
                                                    
        Map <Id,ADC_CareerSupport__c> mapOfcareerSupport = new Map <Id,ADC_CareerSupport__c> ([Select Id,ADC_CareerSupportNoThatHasBeenApplied__c,  ADC_CareerSupportCapacity__c from ADC_CareerSupport__c where Id In :cseIdSet]); 
        
        for (ADC_CareerSupportEntry__c cserecord : careerSupportEntrySObjectList){
            ADC_CareerSupport__c careersupportrecord = mapOfcareerSupport.get(cserecord.ADC_CareerSupportEntryTrainingName__c);
          
            if (cserecord.ADC_CareerSupportEntryCancelStatus__c==null && cserecord.ADC_CareerSupportEntryPermitExcess__c==false) {
              if(Trigger.isInsert){
                if(careersupportrecord.ADC_CareerSupportNoThatHasBeenApplied__c >= careersupportrecord.ADC_CareerSupportCapacity__c) {
                    cserecord.adderror('Not Allowed');
                }  
                }
                else     
                
             if(careersupportrecord.ADC_CareerSupportNoThatHasBeenApplied__c   > careersupportrecord.ADC_CareerSupportCapacity__c) {
                    cserecord.adderror('Not Allowed1');
                }  
                
            }   
        }       
    }        
    
    
    
    
    
    
    
    */
    
}