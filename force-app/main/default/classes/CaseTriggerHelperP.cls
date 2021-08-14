public class CaseTriggerHelperP {
    

    public static void isAfterUpdate(List<Case> cases, Map<Id, Case> oldCases) {
        Id incidentClosedRT = Schema.SObjectType.Case.getRecordTypeInfosByDeveloperName().get('UB_Only_Referral').getRecordTypeId();
        for (Case c : cases) {            
            if ( c.RecordTypeId == incidentClosedRT ){
                Case oldCase = oldCases.get(c.Id);
                  if ( oldCase.Status == 'New ' || oldCase.Status == 'Working ' ){
                    c.Status = 'In Progress';
                   }
            }
                   
        }
    }
    
    public static void subjectUpdate(List<Case> cases) {
        for (case q : cases) {
            if (q.payal09__Subject__c != null) {
                // String s = q.payal09__Subject__c;
                // List<String> sortedvalue = s.split(';');
                //sortedvalue.sort();
                //Update the 'Carrier_Won_From_Lost_To_Text__c' field with the values in the 'current carriers'
                //multi-select picklist so I can use data in validation rules
                q.Subject = q.payal09__Subject__c;
            }
            else {
                q.Subject = null;
            }      
            
        }
    }
}