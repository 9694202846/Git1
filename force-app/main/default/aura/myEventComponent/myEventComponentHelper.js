({
	getEventMethod : function(component, event, helper) {	
        let action = component.get("c.getEventsList");	
        action.setParams({	
            
            queryCondition: component.get("v.eventType")
        });	
        action.setCallback(this, function(data) {
            component.set("v.eventList", data.getReturnValue());
            
        });
        action.setCallback(this, function(response) {
            console.log('response'+response);
           
                component.set('v.columns', [{	
                        label: 'Subject',	
                        fieldName: 'Subject',	
                        sortable: true,	
                        type: 'text'	
                    },	
                    {	
                        label: 'DueDate',	
                        fieldName: 'ActivityDate',	
                        sortable: true,	
                        type: 'Date'	
                    },	
                    
                    {	
                        label: 'RelatedTo',	
                        fieldName: 'WhatId',	
                        type: 'url',	
                        sortable: true,	
                        typeAttributes: {	
                            label: {	
                                fieldName: 'WhatName'	
                            },	
                            target: '_blank'	
                        }	
                    }	
                ]);	
                let rows = response.getReturnValue();	
                console.log('Row'+rows);
                if (!$A.util.isUndefinedOrNull(rows)) {	
                    for (let i = 0; i < rows.length; i++) {	
                        let row = rows[i];	
                        if (!$A.util.isUndefinedOrNull(row.What)) {	
                            row.WhatName = row.What.Name;	
                            row.WhatId = '/' + row.WhatId;	
                        }	
                    }	
                    component.set('v.eventList', rows);	
                }	
                
        });	
        $A.enqueueAction(action);	
    }	
    })