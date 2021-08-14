({
    ModelToastMsg : function(component, event, helper) {
        try
        {
            var action = component.get("c.toastShowDone");
            var recordId = component.get("v.recordId");
            action.setParams({"objId":recordId});
            action.setCallback(this,function(result){
                if (component.isValid() && result.getState() == 'SUCCESS'){
                    var type = "success";
                    var message = 'Record updated!';
                    helper.showToast(component, event, helper, type, message);
                }
                else
                {
                    var type = "error";
                    var message = result.getError()[0].message;
                    helper.showToast(component, event, helper, type, message);
                }
            });
            $A.enqueueAction(action);
            
        }
        catch(e){
            console.log(e);
        }
    },
    
    showToast : function(component, event, helper, type, message) {
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            "title": "Record status",
            "type": type,
            "message": message
        });
        toastEvent.fire();
    }
})