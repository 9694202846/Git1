({ 
    showToastInfo: function(component, event, helper) { 
        var showToast = $A.get("e.force:showToast"); 
        showToast.setParams({ 
            title : 'Testing Toast!!!', 
            message : 'Record Saved Sucessfully.' ,
            type : 'info',
            mode : 'dismissible'
        }); 
        showToast.fire(); 
    },
    showToastSuccess: function(component, event, helper) { 
        var showToast = $A.get("e.force:showToast"); 
        showToast.setParams({ 
            title : 'Testing Toast!!!', 
            message : 'Record Saved Successfully.' ,
            type : 'success',
            mode : 'pester'
        }); 
        showToast.fire(); 
    } ,
    showToastError: function(component, event, helper) { 
        var showToast = $A.get("e.force:showToast"); 
        showToast.setParams({ 
            title : 'Testing Toast!!!', 
            message : 'Record Not Saved due to error.' ,
            type : 'error',
            mode : 'sticky',
            messageTemplate : '{0} - {1}',
            messageTemplateData : ['Salesforce', 'Toasting Demo']
        }); 
        showToast.fire(); 
    } 
})