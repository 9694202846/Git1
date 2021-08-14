({
	doInit : function(component, event, helper) {
      
        
        var opts = [
            { "class": "optionClass", label: "Option1", value: "opt1", selected: "true" },
            { "class": "optionClass", label: "Option2", value: "opt2" },
            { "class": "optionClass", label: "Option3", value: "opt3" }

        ];
        component.find("InputSelectDynamic").set("v.options", opts);
    },
  
    
    onChange: function(component, event, helper) {
		 var dynamicCmp = component.find("InputSelectDynamic");
		 var resultCmp = component.find("dynamicResult");
		 resultCmp.set("v.value", dynamicCmp.get("v.value"));
	 }
    
    
    
    
})