({
	SelectedListViewMethod : function(component, event, helper) {
        
	
        var action = component.get("c.listViewMethod");
        action.setParams({
    ObjectName: component.get("v.SObjectName")
});
        action.setCallback(this, function(data) {
            console.log(data.getReturnValue());
            component.set("v.ListView", data.getReturnValue());
            
        });
        $A.enqueueAction(action);
    }
})