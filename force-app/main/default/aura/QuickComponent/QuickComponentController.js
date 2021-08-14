({
    saveContact : function(component, event, helper) {
        var action= component.get('c.getNewContacts');
                    alert(component.get('v.recordId'));

        action.setParams({ 
            AccountId : component.get('v.recordId') ,

            con: component.get('v.createContact')
            
        });        
        action.setCallback(this, function(data) {
            var state = data.getState();
            alert(state);
            alert(component.get('v.recordId'));
            if(state === 'Success'|| state ==='Draft'){
               
                
                var responsevalue= data.getReturnValue();
                alert(responsevalue);
                
                
            }
            
        });
        $A.enqueueAction(action);
        
    },
    
    
})