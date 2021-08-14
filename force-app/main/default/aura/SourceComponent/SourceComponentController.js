({
	handlePress : function(component, event, helper) {
         var cmpEvent = component.getEvent("componenetEvent");
        
		alert('this is source component');
        cmpEvent.fire();
	}
})