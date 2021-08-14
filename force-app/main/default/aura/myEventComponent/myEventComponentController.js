({
	doInit : function(component, event, helper) {
		helper.getEventMethod(component, event, helper);
	},
    
    
    onChange : function (component, event, helper) {
         component.set("v.showListView", false); 
        alert(component.find('select').get('v.value') );
      var selectedValue = component.find('select').get('v.value');
        component.set("v.eventType", selectedValue);
        helper.getEventMethod(component, event, helper);
         component.set("v.showListView", true); 
       
    }
   

    
})