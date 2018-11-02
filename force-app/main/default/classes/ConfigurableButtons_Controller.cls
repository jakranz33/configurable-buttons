public class ConfigurableButtons_Controller {

    @AuraEnabled
    public static string getButtonConfigLabel(String configName){
        ConfigurableButton__mdt thisButton = [select MasterLabel from ConfigurableButton where DeveloperName = :configName limit 1][0];
        return thisButton.MasterLabel;
    }
}