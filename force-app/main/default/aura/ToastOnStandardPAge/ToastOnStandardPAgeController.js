({
    handleRecordUpdated: function(component, event, helper) {
        var changeType = event.getParams().changeType;
        var toastShown;
        if (changeType === "CHANGED") { 
            if(!$A.util.isUndefinedOrNull(component.get("v.ObjRec")))
            {
                toastShown =  component.get("v.ObjRec").ToastShown__c;
            }
            
            if(!toastShown){
                helper.ModelToastMsg(component, event, helper); 
            }    
        }
        
    }
})