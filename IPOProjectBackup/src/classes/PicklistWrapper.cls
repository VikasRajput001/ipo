public with sharing class PicklistWrapper{
    @AuraEnabled public String label{get;set;}
    @AuraEnabled public String name{get;set;}
    
    public PicklistWrapper(String strlabelARG, String strNameARG){
        this.label = strlabelARG;
        this.name = strNameARG;
    }
}