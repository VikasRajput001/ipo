({
	fetchSelectedMaterialRequestWrap : function(component, event, helper) {
        var selectedRowId = event.currentTarget.id;
        var lstMaterialRequestWrap = component.get("v.lstMaterialRequestWrap");
        for(var eachMR in lstMaterialRequestWrap){
            if(lstMaterialRequestWrap[eachMR].objMaterialRequest.Id == selectedRowId){
                component.set("v.objSelectedMaterialRequestWrap", lstMaterialRequestWrap[eachMR]);
                component.set("v.rowSelected",true);
                //alert(lstMaterialRequestWrap[eachMR].lstOfMaterial);
                break;
            }            
        }
    },
    
    approveMaterialRequest : function(component, event, helper) {
        var action = component.get("c.approveMaterialDataWrap");
		action.setParams({
            objMatReqARG : component.get("v.objSelectedMaterialRequestWrap")
        });
		action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS"){
                alert('SUCCESS');
            }else if (state === "INCOMPLETE"){
                alert('INCOMPLETE');
            }else if (state === "ERROR"){
                alert('ERROR');
            }
            component.set("v.rowSelected",false);
        });
        $A.enqueueAction(action);
    }
})