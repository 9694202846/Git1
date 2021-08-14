({
    doinit : function(component, event, helper) {
        
        /*var createCarRecord = $A.get("e.force:createRecord");
        
        if(createCarRecord){
           component.set("v.ShowNew" ,true) ;
        }else{
           component.set("v.ShowNew" ,false) ; 
        }*/
        helper.getCarType(component,event,helper);
        
        
       
    },
    onSearchMethod : function(component, event, helper) {
       // Get the component event by using the
        // name value from aura:registerEvent
        var SearchFromSubmit = component.getEvent("CarSearchFormSummit");
        SearchFromSubmit.setParams({
            "carTypeId" : component.find("carTypeList").get("v.value")
             });
        SearchFromSubmit.fire();
    
    },
    
    
   /* newValueSelected: function(component, event, helper) {
        var carTypeListid= component.find('carTypeList').get("v.value");
        alert(carTypeListid+ "OptionSlected");
    },*/
    createRecord : function (component, event, helper) {
     var createRecordCar = $A.get("e.force:createRecord");
     createRecordCar.setParams({
     "entityApiName": "payal09__CarType__c"
       
    });
    createRecordCar.fire();
},

    
    
    
    
})