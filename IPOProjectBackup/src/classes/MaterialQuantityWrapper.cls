global class MaterialQuantityWrapper{
    @AuraEnabled public String materialID{get;set;}
    @AuraEnabled public String materialName{get;set;}
    @AuraEnabled public Boolean isSelected{get;set;}
    @AuraEnabled public Decimal orderQuantity{get;set;}
    @AuraEnabled public Decimal approvedQuantity{get;set;}
    @AuraEnabled public Decimal rejectedQuantity{get;set;}
    @AuraEnabled public Decimal stockQuantity{get;set;}
    @AuraEnabled public String materialType{get;set;}
    
    
    
    /*
        
        @Total Parameter: 7
    */
    public MaterialQuantityWrapper fetchMaterailWrapInstance(Id materialIDARG, String materialNameARG, Boolean isSelectedARG,
                                                         Decimal orderQuantityARG, Decimal approvedQuantityARG, 
                                                         Decimal rejectedQuantityARG, Decimal stockQuantityARG,
                                                         String materialTypeARG){
        MaterialQuantityWrapper objMQW = new MaterialQuantityWrapper();
        objMQW.materialID = materialIDARG;
        objMQW.materialName = materialNameARG;
        objMQW.isSelected = isSelectedARG;
        objMQW.orderQuantity = orderQuantityARG;
        objMQW.approvedQuantity = approvedQuantityARG;
        objMQW.rejectedQuantity = rejectedQuantityARG;
        objMQW.stockQuantity = stockQuantityARG;
        objMQW.materialType = materialTypeARG;
        return objMQW;
    }
    
    public static List<MaterialQuantityWrapper> parse(String strJson){
        return (List<MaterialQuantityWrapper>) System.JSON.deserialize(strJson, List<MaterialQuantityWrapper>.class);
    }
}