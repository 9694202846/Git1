({
	
    getCarType : function(component, event, helper) {
        
        var action = component.get("c.getCarTypes ");
       

       
        action.setCallback(this, function(response) {
           var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.CarTypes",response.getReturnValue());
               

                
            }
            else if (state === "INCOMPLETE") {
                alert("From server: ");
            }
            
            
        });

        
        $A.enqueueAction(action);
    }

})