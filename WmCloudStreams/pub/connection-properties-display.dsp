%comment%----- Displays connection type parameters -----%endcomment%
%ifvar connectionGroupProperties%
    <script>resetRows();</script>

	<tr>
       <script>writeTD('row');</script>Package</td>
       <script>writeTD('rowdata-l');</script>
	   %invoke wm.server.packages:packageList%
            <select name="packageName">
            %loop packages%
			%ifvar enabled equals('true')%
                <option name="%value name%" %ifvar packageName vequals(name)% selected="true" %endif% >%value name%</option>
			%endif%	
            %endloop%
            </select></td>
		%endinvoke%		
	</tr>	
		
	<tr>	
        <script>swapRows();writeTD('row');</script>Folder Name</td>
        <script>writeTD('rowdata-l');</script>
        <input id=input size=30 name="connectionFolderName" value="%value connectionFolderName%"></input></td>
    </tr>

    <tr>
        <script>swapRows();writeTD('row');</script>Connection Name</td>
        <script>writeTD('rowdata-l');</script>
        <input id=input size=30 name="connectionName" value="%value connectionName%"></input></td>
    </tr>

    %loop connectionGroupProperties%
		%ifvar hasBasicField equals('true')% %comment%----- new code: check if this group has any field of modelType as Basic -----%endcomment%
			<tr><td class="heading" colspan=2>Connection Groups: %value groupDisplayName%</td></tr>
			%else% 
				<tr class="HIDDENGROUP" style="display:none">
					<td class="heading" colspan=2>Connection Groups: %value groupDisplayName%</td>
				</tr>				
		%endif%
	%loop fields%
	    %ifvar isHidden equals('false')%
			    %ifvar schemaType equals('int')%
				     <script>populateValidationFields("CPROP$%value ../groupType%$%value modelType%$%value propertyKey%")</script>
				%endif%
				%ifvar isRequired equals('true')%
					<script>populateRequiredFields("CPROP$%value ../groupType%$%value modelType%$%value propertyKey%")</script>
				%endif%
			%ifvar modelType equals('Basic')%
				<tr>
					%ifvar isRequired equals('true')%
						<script>writeTD('row');</script>%value displayName%*</td>
					%else%
						<script>writeTD('row');</script>%value displayName%</td>
					%endif%
					
					%ifvar isEncrypted equals('true')%
						<script>writeTD('rowdata-l');swapRows();</script>
						<input id=input size=60 
							   type=password
							   name="CPROP$%value ../groupType%$%value modelType%$%value propertyKey%"
							   value="%value defaultValue%" onchange="passwordChanged(this.form, '%value propertyKey%')"></input></td></tr>
		
					%else%
						<script>writeTD('rowdata-l'); swapRows();</script>
						%ifvar allowedValues% 
		                        <select id=input name="CPROP$%value ../groupType%$%value modelType%$%value propertyKey%">
                                %loop allowedValues%
									%ifvar propertyValue -notempty%
										<option %ifvar allowedValues vequals(propertyValue)% selected %endif%>%value allowedValues%</option>
									%else%
										<option %ifvar allowedValues vequals(defaultValue)% selected %endif%>%value allowedValues%</option>
									%endif%
	                            %endloop%
		                        </select>
							%else%

								%ifvar schemaType equals('boolean')%
								  <select id=input name="CPROP$%value ../groupType%$%value modelType%$%value propertyKey%">
									  <option value="true"  %ifvar propertyValue equals('true')% selected="true" %endif%>true</option>
									  <option value="false" %ifvar propertyValue equals('false')% selected="true" %endif%>false</option>
								  </select>
								%else%						       	
									%ifvar propertyValue -notempty%
										<input id=input size=60 name="CPROP$%value ../groupType%$%value modelType%$%value propertyKey%" 
												value="%value propertyValue%">
										</input>
									%else%
										<input id=input size=60 name="CPROP$%value ../groupType%$%value modelType%$%value propertyKey%" 
											value="%value defaultValue%">
										</input>
									%endif%
								%endif%
								
							%endif%
						</td>
					%endif%
				</tr>
			%else% <!-- if modelType is not Basic -->
				<tr style="display:none">
					<td>%value displayName%</td>
					<td>
					%ifvar isEncrypted equals('true')%
								<input id=input
									   size=60
									   type=password
									   name="CPROP$%value ../groupType%$%value modelType%$%value propertyKey%"
                                       value="%value defaultValue%" onchange="passwordChanged(this.form, '%value propertyKey%')">
								</input>
								
		
					%else%
					%ifvar allowedValues% 
						<select id=input name="CPROP$%value ../groupType%$%value modelType%$%value propertyKey%">
							%ifvar propertyValue -notempty%
								%loop allowedValues%
									<option %ifvar allowedValues vequals(propertyValue)% selected %endif%>%value allowedValues%</option>
								%endloop%
							%else%
								%loop allowedValues%
									<option %ifvar allowedValues vequals(defaultValue)% selected %endif%>%value allowedValues%</option>
								%endloop%
							%endif%
						</select>
					%else%
						%ifvar schemaType equals('boolean')%
							  <select id=input name="CPROP$%value ../groupType%$%value modelType%$%value propertyKey%">
								  <option value="true"  %ifvar propertyValue equals('true')% selected="true" %endif%>true</option>
								  <option value="false" %ifvar propertyValue equals('false')% selected="true" %endif%>false</option>
							  </select>
							%else%						       	
								%ifvar propertyValue -notempty%
									<input id=input name="CPROP$%value ../groupType%$%value modelType%$%value propertyKey%" 
										value="%value propertyValue%" size=60> 
									</input>
								%else%
									<input id=input name="CPROP$%value ../groupType%$%value modelType%$%value propertyKey%" 
										value="%value defaultValue%" size=60> 
									</input>
								%endif%
							%endif%
						%endif%
					%endif%
%endif%					
					</td>
				</tr>	
			%endif%	
        %endif%
    %endloop%
	%endloop%
%endif%
