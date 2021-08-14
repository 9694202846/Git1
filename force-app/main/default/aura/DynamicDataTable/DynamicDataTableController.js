({
    init: function(component, event, helper) {
        var recId = component.get("v.recordId");
        var objectName = component.get("v.sObjectName");
        console.log('objectName=='+objectName);
        var listOfColumns = component.get("v.fieldList").split(",");
        var action = component.get("c.getFieldSet");
        action.setParams({ 
            sObjectName : component.get("v.objectName"),
            listOfFields : listOfColumns,
            linkOnField:component.get("v.linkOnField"),
            isRelatedList:component.get("v.isRelatedList"),
            relatedField:component.get("v.relatedField"),
            isFieldSet:component.get("v.isFieldSet"),
            fieldSetName:component.get("v.fieldSetName"),
            whereClause:component.get("v.whereClause"),
            recordId: recId,
        });
        action.setCallback(this, function(data){
            var state = data.getState();
            if(state==='SUCCESS'){
                const dtColumns = data.getReturnValue().columns;
                const dtData = data.getReturnValue().listData;
                dtColumns.forEach(function(record){
                    if(record.fieldName =='linkName'){
                        let parentLabel = record.parentFieldLabel;
                        let parentFieldName = parentLabel.substring(0, parentLabel.indexOf('.Name'));
                        let key = parentLabel.replace(".Name", "Label");
                        record.fieldName = record.parentFieldName;
                        if( record.fieldName == 'Name') {
                            record.fieldName = 'Id';
                        }
                        record.typeAttributes = {label: {fieldName:key}, target:'_blank'} ;
                        for(var i in dtData) {
                            for(var index in dtData[i]){
                                if(index == parentFieldName) {
                                    dtData[i][key] = dtData[i][index].Name;
                                } 
                            }
                            if(dtData[i][record.fieldName] && record.fieldName != record.parentFieldLabel ){
                                dtData[i][record.fieldName] = '/'+dtData[i][record.fieldName];    
                            }
                        }
                    }
                });
                component.set("v.columns",dtColumns);
                component.set("v.data",dtData);
            }else{
                console.log('error=='+JSON.stringify(data.getError()));
            }
        });       
        $A.enqueueAction(action);
    },
    
    handleSort : function(component,event,helper){
        var sortBy = event.getParam("fieldName");
        var sortDirection = event.getParam("sortDirection");
        component.set("v.sortBy",sortBy);
        component.set("v.sortDirection",sortDirection);
        helper.sortData(component,sortBy,sortDirection);
    },
    
     downloadCsv : function(component,event,helper){
        var stockData = component.get("v.data");
        var csv = helper.convertArrayOfObjectsToCSV(component,stockData);   
         if (csv == null){return;} 
        
	     var hiddenElement = document.createElement('a');
          hiddenElement.href = 'data:text/csv;charset=utf-8,' + encodeURI(csv);
          hiddenElement.target = '_self'; 
          hiddenElement.download = 'ExportData.csv'; 
          document.body.appendChild(hiddenElement); 
    	  hiddenElement.click(); 
        }, 
});