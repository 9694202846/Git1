<aura:application  extends="force:slds">
    <c:LightningJSONDataTable objAPIname="Contact" fieldsAPINameList="Name, Account.Name, Email"
                              columnsLabelList="Contact name, Account Name, Email"
                              sortingOrder="LastModifiedDate DESC" columnForHyperLink="Name"
                              filterCriteria="Email != null" recordsLimit="100"/>
    
    <c:myEventComponent/>
</aura:application>