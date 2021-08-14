({
	getType : function(component, event, helper) {
		 var action = component.get("c.getAccountType");
        console.log('recordId'+component.get("v.recordId"));
        action.setParams({
            recordId: component.get("v.recordId")
        });
        action.setCallback(this, function(data) {
            console.log('Type'+data.getReturnValue());
            
            component.set("v.validateAccount", data.getReturnValue());
            var checkType = component.get("v.validateAccount");
            if(checkType== true){
                helper.showWarning(component, event, helper);
            }
        });
        $A.enqueueAction(action);
	},
    showWarning : function(component, event, helper) {
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            title : 'Warning',
            message: 'This is a warning message.',
            duration:' 5000',
            key: 'info_alt',
            type: 'warning',
            mode: 'sticky'
        });
        toastEvent.fire();
    }
})