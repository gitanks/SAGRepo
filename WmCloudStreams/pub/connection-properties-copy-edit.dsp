%comment%----- Edit connection node -----%endcomment%

%ifvar connectionGroupProperties%
    <!-- <script>setNavigation('connection-list.dsp', '%value TemplateURL%', 'foo');</script> -->
    
    %ifvar readOnly equals('true')%
        %loop connectionGroupProperties%
			<tr><td colspan=2 class="heading">Connection Groups: %value groupDisplayName%</td></tr>          	
	            <tr>
				%loop fields%
					%ifvar isHidden equals('false')%
						%ifvar ../../basic equals('true')%
							%ifvar modelType equals('Basic')%
								<script>writeTDspan('row');</script>%value displayName%</td>              
								<script>writeTDspan('rowdata-l');swapRows();</script>
								%ifvar isEncrypted equals('true')%
									 ******
								%else%
									%ifvar propertyValue%
										%value propertyValue%
									%endif%
								%endif%	
							%endif%	
						%else%	
							<script>writeTDspan('row');</script>%value displayName%</td>              
								<script>writeTDspan('rowdata-l');swapRows();</script>
								%ifvar isEncrypted equals('true')%
									******
								%else%
									%value propertyValue%
								%endif%
						%endif%
					%endif%
	                </td>
				</tr>
				%endloop%
        %endloop%
    %else%
        %loop connectionGroupProperties%
		
		%ifvar ../../basic equals('true')% %comment%----- new code: check if this is showing Basic page -----%endcomment%
			%ifvar hasBasicField equals('true')% %comment%----- new code: check if this group has any field of modelType as Basic -----%endcomment%
				<tr><td colspan=2 class="heading" >Connection Groups: %value groupDisplayName%</td></tr>  
			%else% 
			    <tr class="HIDDENGROUP" style="display:none">
					<td class="heading" colspan=2>Connection Groups: %value groupDisplayName%</td>
				</tr>					
			%endif%
		%endif%
		%ifvar ../../basic equals('false')%
			<tr><td colspan=2 class="heading" >Connection Groups: %value groupDisplayName%</td></tr>
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
					%ifvar isRequired equals('true')%
						<script>writeTDspan('row');</script>%value displayName%*</td>
					%else%
						<script>writeTDspan('row');</script>%value displayName%</td>
					%endif%
					
					%ifvar isEncrypted equals('true')%
							<script>writeTDspan('rowdata-l'); swapRows();</script>
								<input id=input size=60
									   type=password
									   name="CPROP$%value ../groupType%$%value modelType%$%value propertyKey%"
									   >
								</input>
								</td></tr>
		
					%else%
							<script>writeTDspan('rowdata-l'); swapRows();</script>
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
									<input id=input size=60 name="CPROP$%value ../groupType%$%value modelType%$%value propertyKey%" 
											value="%value propertyValue%">
									</input>
								%endif%
							%endif%
						</td> </tr>
					%endif%
				%endif%
			%endif%	
			
			%ifvar isHidden equals('false')%
				%ifvar modelType equals('Advanced')%
					<tr style="display:none">
					<td>%value displayName%</td>
					<td>
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
							<input id=input size=60 name="CPROP$%value ../groupType%$%value modelType%$%value propertyKey%" 
								value="%value propertyValue%">
							</input>
						%endif%
					%endif%								
					</td>
					</tr>
				%endif%	
			%endif%
		%endloop%
	        
        %endloop%
    %endif%
%else%
    <tr><td class="error" colspan=4>Connection properties not found</td></tr>
%endif%
