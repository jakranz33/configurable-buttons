public class ConfigurableButtons_Controller {

    public class AuraResponse {
        @AuraEnabled public String MasterLabel;
        @AuraEnabled public String DeveloperName;

        public AuraResponse(){}

        public AuraResponse(String ml, String dn){
            this.MasterLabel = ml;
            this.DeveloperName = dn;
        }

    }

    @AuraEnabled
    public static Configurable_Button__mdt getButtonConfig(String configName){
        Configurable_Button__mdt thisButton = [select MasterLabel, DeveloperName from Configurable_Button__mdt where DeveloperName = :configName limit 1][0];
        
        return thisButton;
        //return new AuraResponse(thisButton.MasterLabel,thisButton.DeveloperName);
    }
}