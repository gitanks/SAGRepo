<html>
    <head>
        <meta http-equiv="Pragma" content="no-cache">
        <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
        <meta http-equiv="Expires" CONTENT="-1">
        <title>Connector Details</title>
        <link rel="stylesheet" TYPE="text/css" HREF="/WmRoot/webMethods.css"></link>    
	    <link rel="stylesheet" href="css/messages.css" type="text/css"/>
	    <link rel="stylesheet" href="css/cloudstreams.css" type="text/css"/>

        <SCRIPT SRC="/WmRoot/webMethods.js.txt"></SCRIPT>
        
    </head>
    <body>
        <form name="form" action="connector-details.dsp" method="POST" onSubmit="return validateForm(form)">
        <!-- <input type="hidden" name="action" value="editConnection">
        <input type="hidden" name="passwordChange" value="false">
		<!-- <input type="hidden" name="searchConnectionName" value="%value searchConnectionName%"> -->
		<div id="heading" class="breadcrumb">
			CloudStreams &gt; Providers &gt; %value groupName% &gt; %value connectorName% &gt; View Details
		</div>
            <table id="mainTable" class="tableView" width=100%>
            
            <tr>
                <td colspan=2 style="border: 0px;">
                    <ul class="listitems">
						<li><A HREF="connector-list.dsp?providerName=%value providerName%&groupName=%value groupName%">Return to %value connectorName% Connectors</A>
                    </ul>
                </td>
            </tr>
           
		    %invoke wm.cloudstreams.connector.lifecycle.ui:view%
            <tr>
            	<td class="heading" colspan=2>Connector Details</td>
            </tr>

			%ifvar readOnly equals('true')%
                <tr>
                    <td class="evenrow" style="width: 1%; white-space: nowrap;">Copyright</td>
                    %ifvar vendor equals('Software AG')%
                        <script>writeTD('rowdata-l');swapRows();</script>
                            <font style="font-family: trebuchet ms;">
                                    Copyright &copy; 2013-2016 Software AG, Darmstadt, Germany and/or Software AG USA Inc., Reston, VA, 
                                    USA, and/or its subsidiaries and/or its affiliates and/or their licensors.
                                    <br/><br/>
                                    The name Software AG and all Software AG product names are either trademarks or registered trademarks of
                                    Software AG and/or Software AG USA Inc. and/or its subsidiaries and/or its affiliates and/or their licensors.
                                    Other company and product names mentioned herein may be trademarks of their respective owners.
                                    <br/><br/>
                                    Detailed information on trademarks and patents owned by Software AG and/or its subsidiaries is located 
                                    at <a href="http://softwareag.com/licenses">http://softwareag.com/licenses</a>.
                                    <br/><br/>
                                    This software may include portions of third-party products. For third-party copyright notices, license terms,
                                    additional rights or restrictions, please refer to "License Texts, Copyright Notices and Disclaimers of Third
                                    Party Products". For certain specific third-party license restrictions, please refer to section E of the Legal
                                    Notices available under "License Terms and Conditions for Use of Software AG Products / Copyright and Trademark
                                    Notices of Software AG Products". These documents are part of the product documentation, located at
                                    <a href="http://softwareag.com/licenses">http://softwareag.com/licenses</a> and/or in the root installation
                                    directory of the licensed product(s).
                            </font>                            
                        </td>
                    %else%
                        <script>writeTD('rowdata-l');swapRows();</script><pre style="font-family: trebuchet ms;">%value thirdPartyCopyright%</pre></td>
                    %endif%
                </tr>
              %loop connectorInfo%
				%loop properties%
                <tr>
                    <script>writeTDnowrap('row');</script>%value name%</td>
                    <script>writeTD('rowdata-l');swapRows();</script>%value value%</td>
                </tr>

                %endloop%           
              %endloop%
			%endif% 
                  
            </table>
			%onerror%
                %ifvar localizedMessage%
                    %comment%-- Localized error message supplied --%endcomment%
                    <div class="error">%value localizedMessage%</div>
                %else%
                    %ifvar error%
						<div class="error">%value errorMessage%</div>
                    %endif%
                %endif%
            %endinvoke%
			
        </form>    
    </body>
</html>

