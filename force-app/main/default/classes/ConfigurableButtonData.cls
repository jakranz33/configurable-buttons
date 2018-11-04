public class ConfigurableButtonData extends VisualEditor.DynamicPickList{
    
    public override VisualEditor.DataRow getDefaultValue(){
        return new VisualEditor.DataRow('--Select a Button--','');
    }
    
    public override VisualEditor.DynamicPickListRows getValues() {
        List<Configurable_Button__mdt> availableButtons = [select MasterLabel, DeveloperName from Configurable_Button__mdt];
        VisualEditor.DynamicPickListRows returnList = new VisualEditor.DynamicPickListRows();
		returnList.addRow(new VisualEditor.DataRow('--Select a Button--',''));
        if(availableButtons.size() > 0)
        {
            for(Configurable_Button__mdt cb : availableButtons)
            {
                returnList.addRow(new VisualEditor.DataRow(cb.MasterLabel,cb.DeveloperName));
            }
        }

        return returnList;
    }

}