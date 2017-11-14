<html>

<head>
  <meta http-equiv="Pragma" content="no-cache">
  <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
  <meta http-equiv="Expires" content="-1">
  <link rel="stylesheet" type="text/css" href="webMethods.css">
  <script src="webMethods.js"></script>
  
    <TITLE>Integration Server</TITLE>
  </HEAD>

  <BODY onLoad="setNavigation('security-ports.dsp', '/WmRoot/doc/OnlineHelp/wwhelp.htm?context=is_help&topic=IS_Settings_Messaging_webMMsgingSettings_ChangeDefaultConnectionAliasScrn');">

    <TABLE width="100%">

    <TR>
      <TD class="breadcrumb" colspan=2>Settings &gt; Web Services &gt; Set Default Provider Endpoint Aliases
      </TD>
    </TR>
    <TR><TD colspan="2">
    <ul class="listitems"><li class="listitem"><a href="settings-wsendpoints.dsp">Return to Web Services</a></li></UL>

    </TD>
    </TR>

    <TR>
      <TD>
        <TABLE class="tableView">

        <tr>
          <td class="heading" colspan="2">Select Default Provider Aliases</td>
        </tr>
        
        <form name="primary" action="settings-wsendpoints.dsp" method="post">
        <input type="hidden" name="operation" value="setDefault">
        %scope param(transportType='HTTP')%
        %invoke wm.server.ws:listProviderEndpoints%
        %endscope%
           <tr>
            <td class="oddrow-l">HTTP</td>
            <td class="oddrow-l">
                <select name="HTTPAlias" style="min-width: 100px;">
                <option value="" selected</option>
                  %loop endpoints%
                    <option value="%value alias encode(html)%" %ifvar defaultAlias equals('true')%selected%endif%>%value alias encode(html)%</option>
                  %endloop%
                %endinvoke%
            </td>
          </tr>  
        %scope param(transportType='HTTPS')%
        %invoke wm.server.ws:listProviderEndpoints%
        %endscope%
           <tr>
            <td class="oddrow-l">HTTPS</td>
            <td class="oddrow-l">
                <select name="HTTPSAlias" style="min-width: 100px;">
                <option value="" selected</option>
                  %loop endpoints%
                    <option value="%value alias encode(html)%" %ifvar defaultAlias equals('true')%selected%endif%>%value alias encode(html)%</option>
                  %endloop%
                </select>
                %endinvoke%
            </td>
          </tr>  
        <tr>
            <td class="action" colspan="2">
              <input name="action" type="hidden" value="changeDefaultEndpointAlias">
              <input type="submit" value="Update">
            </td>
        </tr>

        </form>
      </TABLE>
    </TD>
  </TR>
</TABLE>
</BODY>
</HTML>
