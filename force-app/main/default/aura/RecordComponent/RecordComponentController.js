({
    
    doInit : function(component, event, helper) { 
        helper.RecordTypeSelectorController(component); 
    },
     handleClose : function(component, event, helper) {
        $A.get("e.force:closeQuickAction").fire() 
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
        }
    }

})