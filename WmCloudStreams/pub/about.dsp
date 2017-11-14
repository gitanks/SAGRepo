<HTML>
<head>
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
    <meta http-equiv="Expires" CONTENT="-1">
    <title>About</title>
    <link rel="stylesheet" TYPE="text/css" HREF="/WmRoot/webMethods.css"></link>
    <link rel="stylesheet" TYPE="text/css" HREF="css/cloudstreams.css"></link>
    <SCRIPT SRC="/WmRoot/webMethods.js.txt"></SCRIPT>
</head>

<body onLoad="setNavigation('about.dsp', 'TEST#TEXT', '');">
	<div id="heading" class="breadcrumb">
		<td class="breadcrumb" colspan=5>CloudStreams &gt; About</td>
	</div>
	
	<table width="100%" id="mainTable" style="border-collapse: collapse;">
		<tr>
			<td style=" padding-top: 12pt;">
			</td>
		</tr>
			<tr>
			<table class="tableView" width="100%">
				<tr>
					<td class="heading" colspan=2>Copyright</td>
				</tr>
				<tr>
					<td class="evenrow-l" colspan=2>
						<table class="tableInline" border="0" width="100%">
							<tr>
								<td valign="top" style="border: 0px;"><img src="images/SAG_logo_blue.png" border="0"/>&nbsp;&nbsp;&nbsp;&nbsp;</td>
								<td style="border: 0px;">
									<b>webMethods CloudStreams</b>
									<br/>
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
										<br/><br/>
										Use, reproduction, transfer, publication or disclosure is prohibited except as specifically provided for in your License Agreement with Software AG.
									</font>      	
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td class="space"/>
				</tr>
				<tr>
					<td class="heading" style="margin-top: 8px;" colspan=2>Software</td>
				</tr>
				<tr>
					<td class="oddrow" width=15%>Product</td>
					<td class="oddrowdata-l" width=100%>webMethods CloudStreams</td>
				</tr>
				%invoke cloudstreams.UIConfig:getServerAttributes%
				<tr>
					<td class="evenrow">Version</td>
					<td class="evenrowdata-l" >%value version%</td>
				</tr>
				<tr>
					<td class="oddrow" nowrap>Updates</td>
					%ifvar patches%
						<td class="oddrowdata-l">
							%loop patches%
								%value%<br>
							%endloop%
						</td>
					%else%
						<td class="oddrowdata-l">None</td>
					%endif%
				</tr>
				<tr>
					<td class="evenrow" nowrap>Build Number</td>
					<td class="evenrowdata-l" >%value build%</td>
				</tr>
				%endinvoke%
			</table>
		</td></tr>
	</table>
</body>
</HTML>