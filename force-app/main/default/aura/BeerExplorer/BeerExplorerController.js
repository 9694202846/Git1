({
    HandleEvent : function(component, event, helper) {
        var message = event.getParam("SearchText");
        var action = component.get("c.SearchBeer");
        action.setParams({
            SearchKeyWord: message
        });
        action.setCallback(this, function(data) {
            var state = data.getState();
                if (state === "SUCCESS") {
               
                var returnvalue  =data.getReturnValue();
                component.set('v.beerList',returnvalue);
                console.log(returnvalue+'returnvalue2' )
                
            }
            else if (state === "INCOMPLETE") {
              
                
                // do something
            }
                else if (state === "ERROR") {
                    
                    
                    var errors = response.getError();
                    if (errors) {
                        if (errors[0] && errors[0].message) {
                            console.log("Error message: " + 
                                        errors[0].message);
                        }
                    } else {
                        console.log("Unknown error");
                    }
                }
        });
        $A.enqueueAction(action);
    }
    
})