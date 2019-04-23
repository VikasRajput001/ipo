({
	fetchMaterialRequestData : function(component, event, helper) {
		var action = component.get("c.loadingMaterialRequestWrap");
		action.setParams({
            objDepartmentIdARG : component.get("v.departmentId")
        });
		action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS"){
                component.set("v.lstMaterialRequestWrap",response.getReturnValue());
                //alert('SUCCESS'+lstMaterialRequestWrap);
            }else if (state === "INCOMPLETE"){
                alert('INCOMPLETE');
            }else if (state === "ERROR"){
                alert('ERROR');
            }
        });
        $A.enqueueAction(action);
	}
    
      
})