({
	 doRedirect: function(component, event, helper) {
        
        var eventSource= event.getSource();
        var  beerobj =  eventSource.get('v.name') ;
        
       var beerid=  component.set("v.beerId", beerobj);
         var modalBody;
         $A.createComponent("c:BeerDeatils", {"beerId":beerobj},
           function(BeerDeatils, status) {
               if (status === "SUCCESS") {
                   modalBody = BeerDeatils;
                  
         component.find('overlayLib').showCustomModal({
                       header: "Application Confirmation",
                       body: modalBody,
                      footer : 'components',
                       showCloseButton: true,
                       cssClass: "mymodal",
                       closeCallback: function() {
                           
                       }
                   })
               }
           })
       /* var navEvt = $A.get("e.force:navigateToSObject");
    navEvt.setParams({
      "recordId":id ,
      "slideDevName": "detail"
    });
    navEvt.fire();*/
    },
    
})