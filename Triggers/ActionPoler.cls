<apex:page controller="aggregatefunctions" >  
    <apex:form >  
        <apex:pageBlock >  
            <apex:pageBlockSection >  
                <apex:pageBlockTable value="{!ac}" var="n">  
                    <apex:column value="{!n.name}"/>  
                    <apex:column value="{!n.AnnualRevenue}"/>  
               </apex:pageBlockTable>  
                   </apex:pageBlockSection>  
            {!sum}  
            {!min}  
            {!max}  
        </apex:pageBlock>  
    </apex:form>  
</apex:page>  
=============