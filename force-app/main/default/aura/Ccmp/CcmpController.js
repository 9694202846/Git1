({
	handlechild : function(component, event, helper) {
		var params = event.getParam('arguments');
        alert(params);
        if (params) {
            var param1 = params.param2;
            alert('in child'+param1);
            // add your code here
        }
	}
})