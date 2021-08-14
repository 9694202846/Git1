({
    handleShowModal: function(component, evt, helper) {

        var modalBody;

        $A.createComponent("c:modalContent", {},
           function(content, status) {
               if (status === "SUCCESS") {
                   modalBody = content;
                   component.find('overlayLib').showCustomModal({
                       header: "Application Confirmation",
                       body: modalBody, 
                       showCloseButton: true,
                       
                       closeCallback: function() {
                           alert('You closed the alert!');
                       }
                   })
               }                               
           });
    }
})