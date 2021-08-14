({
    handleClick : function(component, event, helper) {
    var evt = $A.get("e.force:navigateToComponent");
    evt.setParams({
        componentDef : "c:CreateBeerOrder",
        componentAttributes: {
            "beerId" : component.get("v.beerId")
        }
    });
    evt.fire();
},
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
	}
    
		
	
})