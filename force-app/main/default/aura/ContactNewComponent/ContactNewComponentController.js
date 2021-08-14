({
	myAction : function(component, event, helper) {
        var action = component.get("c.getContacts");
        action.setParams({ 
        accountId : component.get("v.recordId") ,
        });        
        action.setCallback(this, function(data) {
		var totlerecord = component.set("v.ContactList", data.getReturnValue());
             component.set("v.totleRecords",data.getReturnValue().length)
});
		$A.enqueueAction(action);
		
	},
    doRedirect: function(component, event, helper) {
        
        var eventSource= event.getSource();
        var  id =  eventSource.get('v.name') ;
        alert(id);
        var navEvt = $A.get("e.force:navigateToSObject");
    navEvt.setParams({
      "recordId":id ,
      "slideDevName": "detail"
    });
    navEvt.fire();
    }
})