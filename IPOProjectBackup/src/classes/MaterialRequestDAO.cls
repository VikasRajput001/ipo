public class MaterialRequestDAO{
    
    public List<MaterialRequest__c> fetchALLMaterialReqByDepartmentId(Id departmentIDARG){
        return [SELECT Id,Name,OrderDate__c,ReviewDate__c,ApproveDate__c,
                Status__c,RequesterComments__c,ReviewerComments__c,Department__r.Id,Department__r.Name,
                MaterialListFirst__c,MaterialListSecond__c FROM MaterialRequest__c 
                WHERE Department__r.Id =:departmentIDARG];
    }
    
    //Native
    public MaterialRequest__c fetchMaterialReqInstance(Id departmentId){
        return  new MaterialRequest__c(Department__c = departmentId, OrderDate__c = Date.today());
    }
    
    public String updateMaterialRequestData(List<MaterialRequest__c> lstMatReq){
        upsert lstMatReq;
        return 'SUCCESS';
    }
    
}