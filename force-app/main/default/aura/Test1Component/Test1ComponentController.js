({
	doInit : function(component, event, helper) {
		component.get('v.hello');
       console.log('my title' + component.get('v.hello') );
      component.set('v.hello' , 'salesforce');  
         console.log('my title2' + component.get('v.hello') );
	}
})