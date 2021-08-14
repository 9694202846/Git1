({
    myAction : function(component, event, helper) {
       helper.SelectedListViewMethod(component,event,helper);
        
    },
    onChange: function(component, event, helper) {
        component.set("v.showListView", false); 
        var listViewName = component.find('select').get('v.value');
        component.set("v.selectedListView", 'payal09__'+listViewName);
        component.set("v.showListView", true);    
    }
})