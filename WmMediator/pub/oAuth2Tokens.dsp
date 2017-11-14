<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
        "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<head>
    <title>Integration Server - Mediator OAuth2 Tokens</title>
    <link rel="stylesheet" href="/WmRoot/webMethods.css" type="text/css"/>
    <link rel="stylesheet" href="css/mediator.css" type="text/css"/>
    <link rel="stylesheet" href="css/consumers.css" type="text/css"/>
    <link rel="stylesheet" href="css/messages.css" type="text/css"/>
    <script src="js/jquery.js" type="text/javascript"></script>
    <script src="js/consumers.js" type="text/javascript"></script>
</head>
<body>

<div id="heading" class="breadcrumb" style="height:1em">
    List of OAuth2 Tokens
</div>
<br/>
<div id="container">

   %invoke pg.UIConfig:getOAuth2Tokens%

        %ifvar consumers -notempty%
            <div class="links">
                <a href="#" class="expand">Expand All</a> / <a href="#" class="collapse">Collapse All</a>
            </div>

            %loop consumers%
            <div class="consumer">
                <table class="tableView">
                    <tr>
                        <th colspan=2 class="consumer-heading" id="%value clientname%">
                            <span class="img">
								<img id=%value idx% 
									src="images/expanded.gif" 
								alt="expand/collapse"/>
                            %value clientname%
							</span>
                        </th>
                    </tr>
                </table>
                
				<div class="details">
					<table class="tableView">
						<tr>
							<td width=25%>Service Name</td>
							<td>%value serviceNameForOauthToken%</td>       
						</tr>
						<tr>
							<td>OAuth2 Token Expiration Interval</td> 
							%ifvar tokenRefreshInterval -notempty%
								<td>%value tokenRefreshInterval%</td>
							%else%
								<td>Never Expires</td>
							%endif%							
						</tr>
						
						%ifvar description -notempty%
						<tr>
							<td>Description</td> 
							<td>%value description%</td>
						</tr>
						%endif%
					
						%ifvar partnerid -notempty%
		                <tr>
							<td>PartnerID</td> 
							<td>%value partnerid%</td>
		                </tr>
						%endif%
						
						%ifvar clientid -notempty%
						<tr>
							<td>ClientID</td>
							<td>%value clientid%</td>
						</tr>
						%endif%
						
						%ifvar tokens -notempty%
						<tr>
							<td>Tokens</td>
							<td>
								%loop tokens%
								<li>%value token%</li>
								%endloop%
							</td>
						</tr>
						%endif%
						
						%ifvar ranges -notempty%
						<tr>
							<td>IP Ranges</td>
							<td>
								%loop ranges%
								<li>%value rangeFrom% - %value rangeTo%</li>
								%endloop%
							</td>
						</div>
						%endif%
						
						%ifvar serialNumber -notempty%
						<tr>
							<td>Certificate Information</td>
							<td>
								<li><span class="sublabel">Serial Number:</span> %value serialNumber%</li>
								<li><span class="sublabel">Subject DN:</span> %value subjectDN%</li>
								<li><span class="sublabel">Issued By:</span> %value issuerDN%</li>
							</td>
						</tr>
						%endif%					
					</table>
                </div>
            </div>
            %endloop%
        %else%
              <div class="info">No OAuth2 Tokens found!</div>
        %endif%

   %endinvoke%
</div>
</body>
</html>