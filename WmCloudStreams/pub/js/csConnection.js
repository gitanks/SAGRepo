var requiredFields = new Array();
var validationFields = new Array();
var CMGRPROP = { 
  minimumPoolSize : "1", 
  maximumPoolSize :"100", 
  poolIncrementSize : "1", 
  blockTimeout : "1000", 
  expireTimeout : "1000", 
  startupRetryCount : "0", 
  startupBackoffSecs : "10",
  timeoutType : "none",
  sessionExpiry : "15"
  };

function populateRequiredFields(fieldName)
{
  requiredFields.push(fieldName);
}

function populateValidationFields(fieldName)
{
  validationFields.push(fieldName);

}

function isNumber(num)
{
    num = num.toString();
    if (num.length == 0) {
        return false;
    }

    for (var i = 0; i < num.length; i++) {
        var x = num.substring(i, i + 1);
        // LG TRAX 1-NWQZN - Fix to allow negative numbers
        // to be validated....Before all neg numbers errored
        if (i == 0 && x == "-") {
            if(num.length == 1) {
                return false;
            }
        }
        else if (x < "0" || x > "9") {
            return false;
        }
    }

    return true;
}


var pwdLabels = new Array(" "," "," "," "," "," "," "," "," "," "," "," "," "," ");
function passwordChanged(theForm, pwdElem) {
    for(i = 0;i < pwdLabels.length;i++){
	if(pwdLabels[i] == pwdElem){
		break;
	}
	else if(pwdLabels[i] == " "){
		pwdLabels[i] = pwdElem;
		break;
	}
    }
    if(i == pwdLabels.length){
	alert(getmsg("many.password.fields"));
        return false;
    }
    theForm.elements['passwordChange'].value = pwdLabels;
}


function validateForm(theForm)
{
    var returnValue = 0;
    var errors = getmsg("errors") + "\n";

    if (theForm.elements['connectionFolderName'] != null && theForm.elements['connectionFolderName'].value.length == 0) {
        returnValue = -1;
        errors += getmsg("missing.field.name", getmsg("folder.name")) + "\n";
    }

    if (theForm.elements['connectionName'] != null && theForm.elements['connectionName'].value.length == 0) {
        returnValue = -1;
        errors += getmsg("missing.field.name", getmsg("connection.name")) + "\n";
    }

    //var str = "";
	for (i = 0; i < theForm.elements.length; ++i) {
        // password confirmation fields start with "PWD"
        if (theForm.elements[i].name.substring(0, 3) == "PWD") {
            var sname = theForm.elements[i].name.substring(4);
            var dotpos = sname.indexOf('.', 0);
			
            //str += "dotpos = " + dotpos + "\n";
            //str += "theForm.elements[" + sname + "].value = " + theForm.elements[sname].value + "\n";
            //str += "theForm.elements[" + i + "].value = " + theForm.elements[i].value + "\n";
			
            if (theForm.elements[i].value.length == 0 && theForm.elements[sname].value.length > 0) {
                returnValue = -1;
                errors += getmsg("retype.password", sname.substring(dotpos + 1)) + "\n";
            }
            else if (theForm.elements[sname].value.length != theForm.elements[i].value.length) {
			   
                returnValue = -1;
                errors += getmsg("pwd.mismtach", sname.substring(dotpos + 1)) + "\n";
            }
			else if (theForm.elements[sname].value != theForm.elements[i].value) {
			   
                returnValue = -1;
                errors += getmsg("pwd.mismtach", sname.substring(dotpos + 1)) + "\n";
            }
        }
    }
	
	
	//Check for Required Fields Content Length to ensure its not left Blank
	for(i = 0; i < requiredFields.length; i++) {
	  
	  if(!theForm.elements[requiredFields[i]].value.match(/\S/)){
	    
		var displayName = theForm.elements[requiredFields[i]].parentNode.parentNode.getElementsByTagName("td")[0].textContent;
	    returnValue = -1;
	    errors += getmsg("missing.required.field", displayName.substring(0, displayName.length - 1)) + "\n";
	  }  
	}
	
	
	// Data Type validation for Integer Fields 
	for(i = 0; i < validationFields.length; i++) {
	  
	  if(theForm.elements[validationFields[i]].value.length > 0) {
	    
		  if(isNaN(theForm.elements[validationFields[i]].value)){
		    
			var displayName = theForm.elements[validationFields[i]].parentNode.parentNode.getElementsByTagName("td")[0].textContent;
			var index = displayName.indexOf("*");
			if(index != -1 && index == 0){
			 displayName = displayName.substring(1);
			}
			returnValue = -1;
			errors += getmsg("invalid.number", displayName) + "\n";
		  }
		  
		 }
			
	}
    

    

    if (returnValue == -1) {
        alert(errors);
        return false;
    }
    else {
        return true;
    }
}

function setField(field, val)
{
    if (val) {
        field.disabled = false;
    }
    else {
        field.value = "";
        field.disabled = true;
        //field.setAttribute("color", "red");
    }
}

function setEnabledFields(theForm, val)
{
    setField(theForm.elements["CMGRPROP$minimumPoolSize"],   val);
    setField(theForm.elements["CMGRPROP$maximumPoolSize"],   val);
    setField(theForm.elements["CMGRPROP$poolIncrementSize"], val);
    setField(theForm.elements["CMGRPROP$blockTimeout"],   val);
    setField(theForm.elements["CMGRPROP$expireTimeout"],     val);
    setField(theForm.elements["CMGRPROP$startupRetryCount"],   val);
    setField(theForm.elements["CMGRPROP$startupBackoffSecs"],     val);
}

function handlePoolableChange(theForm)
{
    var poolableobj = theForm.elements["CMGRPROP$poolable"];
    var poolable = poolableobj.options[poolableobj.selectedIndex].value;

    if (poolable == "true") {
        theForm.elements["CMGRPROP$minimumPoolSize"].value = CMGRPROP.minimumPoolSize;
        theForm.elements["CMGRPROP$maximumPoolSize"].value = CMGRPROP.maximumPoolSize;
        theForm.elements["CMGRPROP$poolIncrementSize"].value = CMGRPROP.poolIncrementSize;
        theForm.elements["CMGRPROP$blockTimeout"].value = CMGRPROP.blockTimeout;
        theForm.elements["CMGRPROP$expireTimeout"].value = CMGRPROP.expireTimeout;
        theForm.elements["CMGRPROP$startupRetryCount"].value = CMGRPROP.startupRetryCount;
        theForm.elements["CMGRPROP$startupBackoffSecs"].value = CMGRPROP.startupBackoffSecs;

        setEnabledFields(theForm, true);
    }
    else if (poolable == "false") {
        CMGRPROP.minimumPoolSize = theForm.elements["CMGRPROP$minimumPoolSize"].value;
        CMGRPROP.maximumPoolSize = theForm.elements["CMGRPROP$maximumPoolSize"].value;
        CMGRPROP.poolIncrementSize = theForm.elements["CMGRPROP$poolIncrementSize"].value;
        CMGRPROP.blockTimeout = theForm.elements["CMGRPROP$blockTimeout"].value;
        CMGRPROP.expireTimeout = theForm.elements["CMGRPROP$expireTimeout"].value;
        CMGRPROP.startupRetryCount = theForm.elements["CMGRPROP$startupRetryCount"].value;
        CMGRPROP.startupBackoffSecs = theForm.elements["CMGRPROP$startupBackoffSecs"].value;

        setEnabledFields(theForm, false);
    }
}

function handleSessionManagementChange(theForm)
{
    var timeoutTypeObj = theForm.elements["CMGRPROP$timeoutType"];
    var timeoutType = timeoutTypeObj.options[timeoutTypeObj.selectedIndex].value;

    if (timeoutType == "none") {
        CMGRPROP.sessionExpiry = theForm.elements["CMGRPROP$sessionExpiry"].value;
        setField(theForm.elements["CMGRPROP$sessionExpiry"], false);
    }
    else {
        theForm.elements["CMGRPROP$sessionExpiry"].value = CMGRPROP.sessionExpiry; 
        setField(theForm.elements["CMGRPROP$sessionExpiry"], true);
    }
}

function onConnectionPageLoad(theForm)
{		
	if (theForm.elements["CMGRPROP$poolable"]!=undefined && theForm.elements["CMGRPROP$poolable"].value == "false") {
		setEnabledFields(theForm, false);
	}
	if (theForm.elements["CMGRPROP$timeoutType"]!=undefined && theForm.elements["CMGRPROP$timeoutType"].value == "none") {
		setField(theForm.elements["CMGRPROP$sessionExpiry"], false);
	}
}

