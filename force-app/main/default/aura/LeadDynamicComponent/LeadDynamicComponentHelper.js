({
    getDataHelper : function(component, event) {
        var action = component.get("c.getAccRecords");
        //Set the Object parameters and Field Set name
        action.setParams({
            strObjectName : 'Opportunity',
            strFieldSetName : 'payal09__Opportunity_Field_Set'
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === 'SUCCESS'){
                component.set("v.mycolumns", response.getReturnValue().lstDataTableColumns);
                let rows = response.getReturnValue().lstDataTableData
               for (let i = 0; i < rows.length; i++) {
                   let row = rows[i];
                   if ($A.util.isUndefinedOrNull(row.What)) {} else
                       row.Account = row.Account.Name;

               }
             
                
                component.set("v.mydata", rows);    
            }else if (state === 'ERROR'){
                var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        console.log("Error message: " +
                                    errors[0].message);
                    }
                } else {
                    console.log("Unknown error");
                }
            }else{
                console.log('Something went wrong, Please check with your admin');
            }
        });
        $A.enqueueAction(action);	
    }
})