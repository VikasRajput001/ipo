public class MaterialRequestWrapper{
    @AuraEnabled public MaterialRequest__c objMaterialRequest{get;set;}
    @AuraEnabled public List<MaterialQuantityWrapper> lstOfMaterial{get;set;}
    
    public MaterialRequestWrapper fetchMatReqWrapWithQntyWrapInstance(MaterialRequest__c objMaterialRequestARG){
        MaterialRequestWrapper objMaterialReqWrap = new MaterialRequestWrapper();
        objMaterialReqWrap.objMaterialRequest = objMaterialRequestARG;
        objMaterialReqWrap.lstOfMaterial = (List<MaterialQuantityWrapper>) 
                                            System.JSON.deserialize(objMaterialRequestARG.MaterialListFirst__c,
                                            List<MaterialQuantityWrapper>.class);
        
        return objMaterialReqWrap;
    }
    
    
    public MaterialRequestWrapper initMatReqWrapByQntyWrap(MaterialRequest__c objMaterialRequestARG,
                                                            List<MaterialQuantityWrapper> lstOfMaterialARG){
        MaterialRequestWrapper objMaterialReqWrap = new MaterialRequestWrapper();
        objMaterialReqWrap.objMaterialRequest = objMaterialRequestARG;
        objMaterialReqWrap.lstOfMaterial = lstOfMaterialARG;
        
        return objMaterialReqWrap;
    }
}