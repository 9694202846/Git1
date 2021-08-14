({
	handleAdd : function(component, event, helper) {
      var number1 =  component.get('v.firstValue');
      var number2 = component.get('v.secondValue');
      var output = parseInt(number1) + parseInt(number2);
        //alert(output);
        component.set('v.outputField',output);
		
	},
    handleSub : function(component, event, helper) {
        var number1 =  component.get('v.firstValue');
      var number2 = component.get('v.secondValue');
      var output = parseInt(number1) - parseInt(number2);
        //alert(output);
        component.set('v.outputField',output);
		
	},
    handleMult : function(component, event, helper) {
        var number1 =  component.get('v.firstValue');
      var number2 = component.get('v.secondValue');
      var output = parseInt(number1) * parseInt(number2);
        //alert(output);
        component.set('v.outputField',output);
		
	},
    handleDivide : function(component, event, helper) {
        var number1 =  component.get('v.firstValue');
      var number2 = component.get('v.secondValue');
      var output = parseInt(number1) / parseInt(number2);
        //alert(output);
        component.set('v.outputField',output);
		
	}
})