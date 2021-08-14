({
    doSearch : function(component, event, helper) {
        var cmpEvent = component.getEvent('BeerEvent');
        var SearchParam = component.find('enter-search').get('v.value');
        cmpEvent.setParams({
            SearchText :SearchParam
        });
        cmpEvent.fire();	
    }
})