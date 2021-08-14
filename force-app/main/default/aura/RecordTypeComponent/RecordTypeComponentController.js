({
    doInit: function(component, event, helper) {        
      /*  var action = component.get("c.getRecordTypeValues");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var result = response.getReturnValue();
                var recordTypes = result.contactRecordTypes;
                var recordtypeMap = [];
                for(var key in recordTypes){
                    recordtypeMap.push({label: recordTypes[key], value: key});
                }
                component.set("v.recordTypeMap", recordtypeMap);
                component.set("v.selectedRecordTypeId", result.defaultRecordTypeId);
            }
        });
        $A.enqueueAction(action);
    },
     
    handleCreateRecord: function(component, event, helper) { 
        var selectedRecordTypeId = component.get("v.selectedRecordTypeId");
        if(selectedRecordTypeId){
            var createRecordEvent = $A.get("e.force:createRecord");
            createRecordEvent.setParams({
                "entityApiName": 'Contact',
                "recordTypeId": selectedRecordTypeId,
            });
            createRecordEvent.fire();
        }*/
    }
})