({
 addContact : function(component, event, helper) {
        alert('1111');
  var fName=component.get("v.firstName");
        var lName=component.get("v.lastName");
        var action=component.get('c.insertContact');

        action.setParams({
         
            parentAccountId:component.get("v.recordId"),
            firstName1:component.get("v.firstName"),
            lastName1:component.get("v.lastName")
         
        });
        action.setCallback(this,function(response){
            var state=response.getState();
            if(state==="SUCCESS")
            {
                alert('Contact inserted successfully');             
            }
         
        });
        $A.enqueueAction(action);
     
 }
})