public class MaterialDAO{
    
    public List<Material__c> fetchALLMaterial(){
        return [SELECT Id,Name,Type__c,IsActive__c FROM Material__c WHERE IsActive__c =:true];
    }
    
}