({
	handleShowModal : function(component, event, helper) {
		component.find('overlayLib').showCustomModal({
                       header: "Application Confirmation",
                       body: 'modalBody',
                      footer : 'components',
                       showCloseButton: true,
                       cssClass: "mymodal",
                       closeCallback: function() {
                           alert('You closed the alert!');
                       }
                   })
	},
    Navigatation : function(component, event, helper) {
         var navService = component.find("navService");
        var pageReference = 
            /*{
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'Account',
                actionName: 'home'
            }
        }; */
            {
    "type": 'standard__component',
    "attributes": {
        componentName: 'c__payal09__BeerExplorer'
    },
    "state": {
        c__counter: '5'
    }
};
      
       navService.navigate(pageReference);
    },
    navigateToMyComponent : function(component, event, helper) {
    var evt = $A.get("e.force:navigateToComponent");
    evt.setParams({
        componentDef : "c:BeerExplorer",
        componentAttributes: {
            //contactId : component.get("v.contact.Id")
        }
    });
    evt.fire();
},
    
 dynamicComponent : function(component) {
        $A.createComponent(
            "lightning:button",
            {
                
                label: "Create New1",
                value:"Create New1",
                onclick : component.getReference("c.handlePress")
            },
            function(newButton, status, errorMessage){
                //Add the new button to the body array
                if (status === "SUCCESS") {
                    var body = component.get("v.body");
                    body.push(newButton);
                    component.set("v.body", body);
                }
                else if (status === "INCOMPLETE") {
                    console.log("No response from server or client is offline.")
                    // Show offline error
                }
                else if (status === "ERROR") {
                    console.log("Error: " + errorMessage);
                    // Show error message
                }
            }
        );
    },
 
    handlePress : function(cmp) {
        alert('aaaa');
        // Find the button by the aura:id value
       // console.log("button: " + cmp.find("findableAuraId"));
        console.log("button pressed");
    }   
    
    
    
})