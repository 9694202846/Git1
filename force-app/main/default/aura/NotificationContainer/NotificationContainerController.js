({
    doInit : function(component, event, helper) {
        var lWidth = 1000 ;//Get the window's width

        let actionnot = component.get("c.getNotification");
        // Add callback behavior for when response is received
        actionnot.setCallback(this, function(response) {
            let state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.notification", response.getReturnValue());
            }
            else {
                console.log("Failed with state: " + state);
            }
        });
        // Send action off to be executed
        $A.enqueueAction(actionnot);


        //Move Action
        
        setTimeout(
            $A.getCallback(
                function() {
                    var myVar= window.setInterval($A.getCallback(function() { 
                        var float = component.find("p1");
                        if(typeof float === 'undefined' || float === null){
                            console.log("float Undefined");
                            window.clearInterval(myVar);
                        }else{  
                                helper.shiftDiv(component, event,lWidth);
                        }
                    }), 100);
                }
            ),2000
        );
        
    },
    handleShowModalFooter : function (component, event, helper) {
        var modalBody;
        var modalFooter;
        $A.createComponents([
            ["c:NotificationContent",{}],
            ["payal09:notificationFooter",{}]
        ],
            function(components, status){
                console.log("Status: ",status);
                if (status === "SUCCESS") {
                    modalBody = components[0];
                    modalFooter = components[1];
                    component.find('overlayLib').showCustomModal({
                    header:"Type: "+ component.get("v.notification.Notification_Type__c"),
                    body: modalBody,
                    footer: modalFooter,
                    showCloseButton: true,
                    cssClass: "my-modal,my-custom-class,my-other-class,cModalOpener",
                    closeCallback: function() {
                        //alert('You closed the alert!');
                    }
                })
                }
            }
       );
    },
    handleMouseOver : function (component, event, helper) {
        component.set("v.mouseover",false);
    },
    handleMouseOut : function (component, event, helper) {
        component.set("v.mouseover",true);
    }

})