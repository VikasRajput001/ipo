({
    fetchMaterialDataWrap : function(component, event, helper) {
		var action = component.get("c.loadingMaterialQuantityWrap");
		action.setParams({
            objDepartmentIdARG : component.get("v.departmentId")
        });
		action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS"){ 
                component.set("v.objSelectedMaterialRequestWrap",response.getReturnValue());
                
            }else if (state === "INCOMPLETE"){
                alert('INCOMPLETE');
            }else if (state === "ERROR"){
                alert('ERROR');
            }
        });
        $A.enqueueAction(action);
	},
    submitMaterialDataWrap : function(component, event, helper) {
        var action = component.get("c.submitMaterialDataWrap");
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
            this.redirectToMatReqLstView(component, event, helper);
        });
        $A.enqueueAction(action);
    },
    redirectToMatReqLstView : function(component, event, helper){
        var materialRequestLstView = component.get('v.materialRequestLstView');
        $A.enqueueAction(materialRequestLstView);
    }
    
})