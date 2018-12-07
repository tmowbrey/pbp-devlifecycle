public class PropertyPagedResult {
	@AuraEnabled
	public String myNewVariable {get;set;}
    
    @AuraEnabled
    public Integer pageSize { get;set; }
    
    @AuraEnabled
    public Integer page { get;set; }
    
    @AuraEnabled
    public Integer total { get;set; }
    
    @AuraEnabled
    public List<Property__c> properties { get;set; }
    
}
