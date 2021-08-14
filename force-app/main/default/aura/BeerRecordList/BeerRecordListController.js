({
    myAction : function(component, event, helper) {
        var action = component.get("c.SearchBeer");
        action.setParams({ 
            
        });        
        action.setCallback(this, function(data) {
            var totlerecord = component.set("v.recordList", data.getReturnValue());
            
        });
        $A.enqueueAction(action);
        
    },
    
})