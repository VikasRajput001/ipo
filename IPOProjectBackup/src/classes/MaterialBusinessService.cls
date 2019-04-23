public class MaterialBusinessService{
    
    public List<MaterialRequestWrapper> fetchMaterialRequestData(Id departmentIDARG){
        List<MaterialRequestWrapper> lstMaterialReqWrap = new List<MaterialRequestWrapper>();
        List<MaterialRequest__c> lstMaterialRequest = new MaterialRequestDAO().fetchALLMaterialReqByDepartmentId(departmentIDARG);
        for(MaterialRequest__c eachMatReq : lstMaterialRequest){
            lstMaterialReqWrap.add(new MaterialRequestWrapper().fetchMatReqWrapWithQntyWrapInstance(eachMatReq));
        }
        return lstMaterialReqWrap;
    }
    
    public MaterialRequestWrapper fetchNewMaterialData(String objDepartmentIdARG){
        MaterialRequest__c objMR = new MaterialRequest__c(ApproveDate__c=null,OrderDate__c=Date.today(),
                                                            Department__c=objDepartmentIdARG,Status__c='Step_1');
        List<MaterialQuantityWrapper> lstMaterialQNTYWrapper = new List<MaterialQuantityWrapper>();
        List<Material__c> lstMaterial = new MaterialDAO().fetchALLMaterial();
        for(Material__c eachMaterial : lstMaterial){
            lstMaterialQNTYWrapper.add(new MaterialQuantityWrapper().fetchMaterailWrapInstance(eachMaterial.Id,eachMaterial.Name,false,0,0,0,0,eachMaterial.Type__c));
        }
        return new MaterialRequestWrapper().initMatReqWrapByQntyWrap(objMR,lstMaterialQNTYWrapper);
    }
    
    public String createNewMaterialReqData(MaterialRequestWrapper objMatReqARG){
        List<MaterialQuantityWrapper> lstSelectedMaterialQNTYWrap = new List<MaterialQuantityWrapper>();
        for(MaterialQuantityWrapper eachMaterialQNTY : objMatReqARG.lstOfMaterial){
            if(eachMaterialQNTY.isSelected){
                lstSelectedMaterialQNTYWrap.add(eachMaterialQNTY);
            }
        }
        if(!lstSelectedMaterialQNTYWrap.isEmpty()){
            MaterialRequest__c objMatReq = objMatReqARG.objMaterialRequest;
            objMatReq.MaterialListFirst__c = JSON.serialize(lstSelectedMaterialQNTYWrap);
            List<MaterialRequest__c> lstMatReqData = new List<MaterialRequest__c>();
            lstMatReqData.add(objMatReq);
            new MaterialRequestDAO().updateMaterialRequestData(lstMatReqData);
            return 'SUCCESS';
        }
        return 'ERROR';
    }
    
    public String approveMaterialReqData(MaterialRequestWrapper objMatReqARG){
        objMatReqARG.objMaterialRequest.Status__c = 'Step_3';
        objMatReqARG.objMaterialRequest.MaterialListFirst__c = JSON.serialize(objMatReqARG.lstOfMaterial);
        List<MaterialRequest__c> lstMatReqData = new List<MaterialRequest__c>();
        lstMatReqData.add(objMatReqARG.objMaterialRequest);
        new MaterialRequestDAO().updateMaterialRequestData(lstMatReqData);
        return 'ERROR';
    }
    
}