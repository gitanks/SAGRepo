<HTML>
  <HEAD>
    <meta http-equiv="Pragma" content="no-cache">
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
    <META HTTP-EQUIV="Expires" CONTENT="-1">
    <TITLE>Integration Server -- Manage Providers</TITLE>
    <LINK REL="stylesheet" TYPE="text/css" HREF="css/webMethods.css">
    <SCRIPT src="webMethods.js.txt"></SCRIPT>
   </HEAD>

  <BODY onLoad="setNavigation('connector-list.dsp', '/WmRoot/doc/OnlineHelp/wwhelp.htm?context=is_help&topic=IS_Packages_InboundRelScrn');">
    <TABLE WIDTH=100%>
      <TR>
        <TD class="menusection-Packages" colspan=2>
          Cloudstreams &gt;
          Providers &gt;
          Import providers
        </TD>
      </TR>


      %ifvar action%
        %switch action%
          %case 'import'%
            %invoke admin:importProvider%
              %ifvar message%
      <tr><td colspan="2">&nbsp;</td></tr>
                <TR><TD class="message" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;%value none message%</TD></TR>
              %endif%
            %endinvoke%
        %endswitch%
      %endif%


      %scope param(additional='all')%
      %invoke admin:providerListInbound%
      <TR>
	<td colspan="2">
          <ul class="listitems"><LI><A HREF="connector-list.dsp">Return to Cloudstreams providers</A></LI></UL>
	</td>
      </tr>
	<tr><td><img src="images/blank.gif" height="10" width="10" border="0"></td>
	  <td>
          <TABLE class="tableForm">
            <FORM name="inbound" action="provider-inbound.dsp" method="POST">
            <TR>
            <INPUT type="hidden" name="action" value="import">
              <TD class="heading" colspan=2>Inbound Providers</TD>
            </TR>
            %ifvar inboundProviderList -notempty%
              <TR>
                <TD class="oddrow">Provider Bundle name</TD>
                <TD class="oddrow-l">
                  <SELECT NAME="providerBundle" WIDTH=150> %loop inboundProviderList%
                    <OPTION VALUE="%value providerBundleName%">%value providerBundleName%</OPTION> %endloop%
                  </SELECT>
                </TD>
              </TR>
              <TR>
                <TD class="evenrow">Option</TD>
                <TD class="evenrow-l">
                  <INPUT type="checkbox" name="enableOnImport"
                  checked> Enable upon import</INPUT><BR/>
                </TD>
              </TR>
              <TR>
                <TD class="action" colspan=2>
                  <INPUT type="submit" value="Import Provider">
                </TD>
              </TR>
            %else%
              <TR>
                <TD class="oddcol" colspan=2>No inbound provider to import</TD>
              </TR>
            %endif%
            </FORM>
       </TABLE>
     </TD>
   </TR>
   %endinvoke%
   %endscope%
 </TABLE>
</BODY>
</HTML>
