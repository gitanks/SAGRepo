<HTML>
    <head>
        <meta http-equiv="Pragma" content="no-cache">
        <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
        <meta http-equiv="Expires" CONTENT="-1">
        <title>List Connections</title>
        <link rel="stylesheet" TYPE="text/css" HREF="/WmRoot/webMethods.css"></link>
        <link rel="stylesheet" TYPE="text/css" HREF="css/messages.css"></link>
        <link rel="stylesheet" TYPE="text/css" HREF="css/cloudstreams.css"></link>
        <script src="js/connectionfilter.js"></script>

        <SCRIPT LANGUAGE="JavaScript">
            function confirmDisable (aliasName)
            {            	
                var s1 = "OK to disable the `"+aliasName+"' connection?\n\n";
                var s2 = "Disabling a connection causes all services to be \n";
                var s3 = "unavailable for use.\n";
                return confirm (s1+s2+s3);
            }
           
            function confirmEnable (aliasName)
            {      
                var s1 = "OK to enable the `"+aliasName+"' connection?\n\n";
                return confirm (s1);
            }
            function confirmDelete (aliasName)
            {
                var s1 = "OK to delete the `"+aliasName+"' connection?\n\n";
                return confirm (s1);
            }            
        </SCRIPT>
        <SCRIPT SRC="/WmRoot/webMethods.js.txt"></SCRIPT>
    </head>

    <BODY onLoad="setNavigation('connection-list.dsp','/WmCloudStreams/doc/OnlineHelp/cloudstreams.html');showHideFilterCriteria('searchConnectionName');">
	<div id="heading" class="breadcrumb">
		CloudStreams &gt; Providers &gt; %value groupName% &gt; %value connectorName% &gt; Connections
	</div>
	
	<form name="form" action="connection-list.dsp" method="POST">	
        <table id="connTable" width="100%">
        
		<!-- action processing -->
        %ifvar action%
            %switch action%
                %case 'enableConnection'%
                    %invoke pub.cloudstreams.admin.connection:enableConnection%
						%ifvar statusMessage%
							  <tr><td class=%ifvar status equals('true')% "success" %else% "error" %endif% colspan = 8>%value statusMessage%</td></tr>
						%endif%
                    %endinvoke%
					
				%case 'disableConnection'%
                    %invoke pub.cloudstreams.admin.connection:disableConnection%
						%ifvar statusMessage%
							  <tr><td class=%ifvar status equals('true')% "success" %else% "error" %endif% colspan = 8>%value statusMessage%</td></tr>
						%endif%
                    %endinvoke%	
					
				%case 'deleteConnection'%
                    %invoke wm.cloudstreams.connection.ui:remove%
						%ifvar statusMessage%
							  <tr><td class=%ifvar status equals('true')% "success" %else% "error" %endif% colspan = 8>%value statusMessage%</td></tr>
						%endif%
					%endinvoke%		

				%case 'saveConnection'%
                    %invoke wm.cloudstreams.connection.ui:create%
						%ifvar statusMessage%
							  <tr><td class=%ifvar status equals('true')% "success" %else% "error" %endif% colspan = 8>%value statusMessage%</td></tr>
						%endif%
					%endinvoke%
				
				%case 'updateConnection'%
                    %invoke wm.cloudstreams.connection.ui:update%
						%ifvar statusMessage%
							  <tr><td class=%ifvar status equals('true')% "success" %else% "error" %endif% colspan = 8>%value statusMessage%</td></tr>
						%endif%
					%endinvoke%
            %endswitch%
        %endif%
	
		<!-- Filter UI -->
	    <tr>
            <td colspan=2>
                <ul class="listitems">
				<li><a href="connector-list.dsp?groupName=%value groupName%">Return to Connectors </a>
				
                <li><a href="/WmCloudStreams/connection-properties.dsp?providerName=%value providerName%&groupName=%value groupName%&connectionType=sagcloud&basic=true&connectorID=%value connectorID%&connectorName=%value connectorName%">Configure New Connection</a>
				
                <li id="showfew" name="showfew"><a href="javascript:showFilterPanel(true)">Filter Connections</a></li>
				
                <li style="display:none" id="showall" name="showall"><a href="/WmCloudStreams/connection-list.dsp?providerName=%value providerName%&groupName=%value groupName%&connectorID=%value connectorID%&connectorName=%value connectorName%&providerConnectionType=sagcloud">Show All Connections</a></li>
				
				<DIV id="filterContainer" name="filterContainer" style="display:none;padding-top=2mm;">
                 <br>
                  <table>
				  <tr valign="top">
					<td>
                    	<span>Filter criteria</span><br>                    	
                    	<input id="searchConnectionName" name="searchConnectionName" value="%value searchConnectionName%" onkeydown="return processKey(event)" />
					</td>
					<td>					
                     <br>
                        <input id="submitButton" name="Search" type="submit" value="Search" width="15" height="15" onClick="validateSearchCriteria('searchConnectionName');return false;"/> 
                     </br>
                    </td> 
                  </tr>
                  </table>
                 </br>  
                </DIV>
                </ul>
            </td>
        </tr>

	
		<!-- connection display -->
		%invoke wm.cloudstreams.connection.ui:list%
 
        <tr>
            <td class="heading" colspan=8>Connections</td>
        </tr>
        <tr class="subheading2"> 
            <td class="oddcol-l">Connection Name
			<a id="ascCN" href="/WmCloudStreams/connection-list.dsp?connectorID=%value connectorID%&searchConnectionName=%value searchConnectionName%&sortCriteria=connectionAlias&sortOrder=ASC&groupName=%value groupName%&connectorName=%value connectorName%&providerName=%value providerName%">
				<img border="0" style="float: middle" src="images/arrow_up.gif" width="15" height="15">
			</a>
            <a id="desCN" href="/WmCloudStreams/connection-list.dsp?connectorID=%value connectorID%&searchConnectionName=%value searchConnectionName%&sortCriteria=connectionAlias&sortOrder=DESC&groupName=%value groupName%&connectorName=%value connectorName%&providerName=%value providerName%">
				<img border="0" src="images/arrow_down.gif" style="float: middle" width="15" height="16">
			</a>
			</td>
            <td class="oddcol-l">Package Name
			<a id="ascCN" href="/WmCloudStreams/connection-list.dsp?connectorID=%value connectorID%&searchConnectionName=%value searchConnectionName%&sortCriteria=packageName&sortOrder=ASC&groupName=%value groupName%&connectorName=%value connectorName%&providerName=%value providerName%">
				<img border="0" src="images/arrow_up.gif" align="baseline" width="15" height="15">
			</a>
            <a id="desCN" href="/WmCloudStreams/connection-list.dsp?connectorID=%value connectorID%&searchConnectionName=%value searchConnectionName%&sortCriteria=packageName&sortOrder=DESC&groupName=%value groupName%&connectorName=%value connectorName%&providerName=%value providerName%">
				<img border="0" src="images/arrow_down.gif" align="baseline" width="15" height="16">
			</a>
			</td>
            <td class="oddcol-l">Connection Type
			<a id="ascCN" href="/WmCloudStreams/connection-list.dsp?connectorID=%value connectorID%&searchConnectionName=%value searchConnectionName%&sortCriteria=connectionType&sortOrder=ASC&groupName=%value groupName%&connectorName=%value connectorName%&providerName=%value providerName%">
				<img border="0" src="images/arrow_up.gif" align="baseline" width="15" height="15">
			</a>
            <a id="desCN" href="/WmCloudStreams/connection-list.dsp?connectorID=%value connectorID%&searchConnectionName=%value searchConnectionName%&sortCriteria=connectionType&sortOrder=DESC&groupName=%value groupName%&connectorName=%value connectorName%&providerName=%value providerName%">
				<img border="0" src="images/arrow_down.gif" align="baseline" width="15" height="16">
			</a>
			</td>
			
            <td class="oddcol">Enabled
			<a id="ascCN" href="/WmCloudStreams/connection-list.dsp?connectorID=%value connectorID%&searchConnectionName=%value searchConnectionName%&sortCriteria=connectionState&sortOrder=ASC&groupName=%value groupName%&connectorName=%value connectorName%&providerName=%value providerName%">
				<img border="0" src="images/arrow_up.gif" align="baseline" width="15" height="15">
			</a>
            <a id="desCN" href="/WmCloudStreams/connection-list.dsp?connectorID=%value connectorID%&searchConnectionName=%value searchConnectionName%&sortCriteria=connectionState&sortOrder=DESC&groupName=%value groupName%&connectorName=%value connectorName%&providerName=%value providerName%">
				<img border="0" src="images/arrow_down.gif" align="baseline" width="15" height="16">
			</a>
			</td>
            <td class="oddcol">Edit</td>
            <td class="oddcol">View</td>
            <td class="oddcol">Copy</td>	
            <td class="oddcol">Delete</td>
        </tr>
                    
        %ifvar connectionAliasList -notempty%
            %loop connectionAliasList%
            
                <tr class="row">
                    <script>writeTD('row-l');</script>%value connectionAlias%</td>
                    <script>writeTD('row-l');</script>%value packageName%</td>
                    <script>writeTD('row-l');</script>
                        %value connectionType%
    
                    %switch connectionState%
                        %case 'enabled'%
                            <script>writeTD('rowdata');</script>
                            <a class="imagelink" href="/WmCloudStreams/connection-list.dsp?action=disableConnection&connectionAlias=%value connectionAlias%&searchConnectionName=%value ../searchConnectionName%&providerName=%value /providerName%&groupName=%value /groupName%&providerConnectionType=sagcloud&connectorID=%value /connectorID%&connectorName=%value /connectorName%"
							ONCLICK="return confirmDisable('%value connectionAlias%');">
                                    <IMG SRC="/WmRoot/images/green_check.gif" border="0" height=13 width=13>Yes
                                </a>
    
                        %case 'disabled'%
                            <script>writeTD('rowdata');</script>
	                        <a class="imagelink" href="/WmCloudStreams/connection-list.dsp?action=enableConnection&connectionAlias=%value connectionAlias%&searchConnectionName=%value ../searchConnectionName%&providerName=%value /providerName%&groupName=%value /groupName%&providerConnectionType=sagcloud&connectorID=%value /connectorID%&connectorName=%value /connectorName%"
							ONCLICK="return confirmEnable('%value connectionAlias%');">
                                    <img src="/WmRoot/images/blank.gif" border=0 alt="Enable">No
                            </a>
    
                    %endswitch%
    
					%ifvar connectionState equals('disabled')%
                        <script>writeTD('rowdata');</script>
                            <a href="/WmCloudStreams/connection-details.dsp?readOnly=false&connectionAlias=%value connectionAlias%&searchConnectionName=%value ../searchConnectionName%&providerName=%value /providerName%&groupName=%value /groupName%&connectionType=sagcloud&connectorID=%value /connectorID%&connectorName=%value /connectorName%&basic=true">
                                <img src="/WmCloudStreams/icons/config_edit.gif" alt="Edit" border=0>
                            </a>
                        </td>
                    %else%
                        <script>writeTD('rowdata');</script>
                            <img src="/WmCloudStreams/icons/disabled_edit.gif" alt="Disable Connection to Edit" border=0>
                        </td>
                    %endif%
	    
                    <script>writeTD('rowdata');</script>
                       <a href="/WmCloudStreams/connection-details.dsp?readOnly=true&connectionAlias=%value connectionAlias%&providerName=%value /providerName%&groupName=%value /groupName%&connectionType=sagcloud&connectorID=%value /connectorID%&connectorName=%value /connectorName%&basic=true">
                        <img src="/WmRoot/icons/file.gif" alt="View" border=0>
                        </a>
                    </td>
    
                    <script>writeTD('rowdata');</script>
                    
                        <a href="/WmCloudStreams/connection-details-copy.dsp?connectionAlias=%value connectionAlias%&searchConnectionName=%value ../searchConnectionName%&basic=true&providerName=%value /providerName%&groupName=%value /groupName%&connectionType=sagcloud&connectorID=%value /connectorID%&connectorName=%value /connectorName%">
                            <img src="/WmCloudStreams/icons/copy.gif" alt="Copy" border=0>
                        </a>
                    </td>
    
                    <script>writeTD('rowdata');swapRows();</script>
                        %ifvar connectionState equals('disabled')%
                            <a href="/WmCloudStreams/connection-list.dsp?action=deleteConnection&connectionAlias=%value connectionAlias%&searchConnectionName=%value ../searchConnectionName%&providerName=%value /providerName%&groupName=%value /groupName%&providerConnectionType=sagcloud&connectorID=%value /connectorID%&connectorName=%value /connectorName%"
                               ONCLICK="return confirmDelete('%value connectionAlias%');">
                                <img src="/WmRoot/icons/delete.gif" alt="Delete" border=0>
                            </a>
                        %else%
                            <img src="/WmRoot/icons/delete_disabled.gif" alt="Disable Connection to Delete" border=0>
                        %endif%
                    </td>
                </tr>
            %endloop%
        %else%
            <tr><td class="info" colspan=8>No connections found</td></tr>
        %endif%		
		
        %onerror%
            %ifvar localizedMessage%
                <tr><td class="error">%value localizedMessage%</pre></td></tr>
            %else%
                %ifvar error%
                    <tr><td class="error">%value errorMessage%</pre></td></tr>
                %endif%
            %endif%
        %endinvoke%
        </table>
	  <input type="hidden" name="connectorID" value="%value connectorID%">
      <input type="hidden" name="searchConnectionName" value="%value searchConnectionName%">     	
	  <input type="hidden" name="groupName" value="%value groupName%">
	  <input type="hidden" name="connectorName" value="%value connectorName%">
	  <input type="hidden" name="providerName" value="%value providerName%">
	</form>
    </body>
</HTML>
