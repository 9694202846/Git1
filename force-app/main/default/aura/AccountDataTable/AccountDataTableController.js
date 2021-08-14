({
    fetchAccounts: function(component, event, helper) {
        component.set('v.mycolumns', [{
                label: 'Account Name',
                sortable: true,
                fieldName: 'linkName',
                type: 'url',
              // sortable: true,
                typeAttributes: {

                    label: {
                        fieldName: 'Name'
                    },
                    target: '_blank'
                }
            },

            {
                label: 'Industry',

                fieldName: 'Industry',
                sortable: true,
                type: 'text'
               //sortable: true,
            },
            {
                label: 'Type',
                fieldName: 'Type',
                sortable: true,
                type: 'text'
               // sortable: true,
            }
        ]);
        var action = component.get("c.fetchAccts");
        action.setParams({});
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var records = response.getReturnValue();
                
                   records.forEach(function(record) {
                    record.linkName = '/' + record.Id;
                });
                component.set("v.acctList", records);
                component.set("v.totalRecordsCount", records.length);

                
            }
        });
        $A.enqueueAction(action);
    },
    handleSort : function(component,event,helper){
        //Returns the field which has to be sorted
        var sortBy = event.getParam("fieldName");
        //returns the direction of sorting like asc or desc
        var sortDirection = event.getParam("sortDirection");
        //Set the sortBy and SortDirection attributes
        component.set("v.sortBy",sortBy);
        component.set("v.sortDirection",sortDirection);
        // call sortData helper function
        helper.sortData(component,sortBy,sortDirection);
    }
})