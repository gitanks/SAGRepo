function validateSearchCriteria(name){
	var searchConnectionName=document.getElementById(name).value;	
	if(searchConnectionName=="" || searchConnectionName == null || trim(searchConnectionName).length==0){	
       alert(getmsg("missing.filter.criteria"));
    }else if(specialCharacterCheck(searchConnectionName) == true){    	
    	form.submit();    	
    }
}

function specialCharacterCheck(searchConnectionName){
	var error = true;
	var iChars = "!@#$%^&()+=-[]\\\';,/{}|\"<>?";
	//var iChars = "!@#$%^&()+=-[]\\\';,./{}|\"<>?";	
	if(!searchConnectionName.match(/^\S+$/)) {
			//white space check.
	   		alert(getmsg("spcl.chars.in.filter"));
	   		error=false;
	}else{		
	for (var i = 0; i < searchConnectionName.length; i++) {
		if (iChars.indexOf(searchConnectionName.charAt(i)) != -1) {
	   		alert(getmsg("spcl.chars.in.filter"));
				error=false;
				break;
		}
	}
	}
	return error;	
 }
 
function showFilterPanel(){
        var filtercontainer = document.getElementById("filterContainer");
        var showall = document.getElementById("showall");
        var showfew = document.getElementById("showfew");
        showall.style.display="";
        showfew.style.display="none";
        filtercontainer.style.display="";

}
function trim(a){
        return a.replace(/^\s+|\s+$|\n+$/gm, '');

}
            
//After submitting the form searchConnectionName,pStart and pEnd variables were not getting displayed.
//TODO tobe removed after checking whether it's useful in cloudstreams
function submitURL(url){
	var searchConnectionName = 	document.getElementById('searchConnectionName').value;
    if(url!=null || url.length>0){
    	if(searchConnectionName == null && trim(searchConnectionName.value).length==0){
         	alert(getmsg("missing.search.criteria"));
        }	
    }    
    url=url+"&searchConnectionName="+searchConnectionName;
    document.location.href=url;
}

function showHideFilterCriteria(name) 
{
    var filtercontainer = document.getElementById("filterContainer");
    var searchConnectionName=document.getElementById(name);            	               	    	 
    var showall = document.getElementById("showall");
    var showfew = document.getElementById("showfew");                  
    if(searchConnectionName!=null && searchConnectionName.value!="" && searchConnectionName.value!=undefined && searchConnectionName.value.length > 0){                                       
       showall.style.display="";
       showfew.style.display="none";
       filtercontainer.style.display="";
       //In order to encode the value so that %3A won't get displayed in case of :
       	document.getElementById(name).value=unescape(searchConnectionName.value);
    }
                   
} 


function processKey(e)
{
    if (null == e)
        e = window.event ;
    if (e.keyCode == 13)  {
        document.getElementById("submitButton").click();
        return false;
    }
}
