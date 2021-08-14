({
	sortData : function(component,fieldName,sortDirection){
        var data = component.get("v.data");
        var key = function(a) { return a[fieldName]; }
        var reverse = sortDirection == 'asc' ? 1: -1;
        if(fieldName == 'Number'){ 
            data.sort(function(a,b){
                var a = key(a) ? key(a) : '';
                var b = key(b) ? key(b) : '';
                return reverse * ((a>b) - (b>a));
            }); 
        }
        else{
            data.sort(function(a,b){ 
                var a = key(a) ? key(a).toLowerCase() : '';
                var b = key(b) ? key(b).toLowerCase() : '';
                return reverse * ((a>b) - (b>a));
            });    
        }
        component.set("v.data",data);
    },
    
    convertArrayOfObjectsToCSV : function(component,objectRecords){
        var csvStringResult, counter, keys, columnDivider, lineDivider;
        if (objectRecords == null || !objectRecords.length) {
            return null;
         }
        columnDivider = ',';
        lineDivider =  '\n';
        keys =  component.get("v.fieldList").split(",");
        csvStringResult = '';
        csvStringResult += keys.join(columnDivider);
        csvStringResult += lineDivider;
        for(var i=0; i < objectRecords.length; i++){   
            counter = 0;
             for(var sTempkey in keys) {
                var skey = keys[sTempkey] ;  
                  if(counter > 0){ 
                      csvStringResult += columnDivider; 
                   }   
               csvStringResult += '"'+ objectRecords[i][skey]+'"'; 
               counter++;
            }
             csvStringResult += lineDivider;
          }
        return csvStringResult;        
    },
})