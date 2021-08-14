({
    createRecordFun : function (component, event, helper) {
        var rtDet = document.querySelector('input[name="recordTypeRadio"]:checked');
                var rtDet2 = document.querySelector('input[name="recordTypeRadio"]:checked').value;
        alert(rtDet2);

        if(rtDet != null) {
            document.getElementById("newClientSectionId").style.display = "none" ;
            var createRecordEvent = $A.get("e.force:createRecord");
            createRecordEvent.setParams({
                "entityApiName": "Contact",
                "recordTypeId":rtDet.id
            });
            createRecordEvent.fire();
        } 
    },
    doInit : function(component, event, helper) { 
        helper.RecordTypeSelectorController(component); 
    }

})