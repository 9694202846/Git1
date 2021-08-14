({
    doInit :function (component, event, helper) {
    },
    
    onChange: function (component, event, helper) {
        var listView = component.find('select').get('v.value');
        component.set("v.listViewName",listView);
        
    }
});