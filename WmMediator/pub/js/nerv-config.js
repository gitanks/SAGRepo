/**
* This script is used by the nerv-config-edit.dsp 
*   to hide the Performance interval text box based on the report checkbox and
*   perform validation for the field.
*   @author mki
**/

$(function() {
    updateReportInterval();
});



$(document).ready(function() {

$("input[name='pg.nerv.PgMenConfiguration.reportInterval']").blur(checkReportInterval);
$("input[name='pg.nerv.PgMenConfiguration.perfDataEnabled']").click(updateReportInterval);

});

function checkReportInterval() {
    var intEl = $('input[name="pg.nerv.PgMenConfiguration.reportInterval"]')[0];
    var pattern = /^\d{1,2}$/;

    if (intEl != null) {
        var val = intEl.value;
        var result = val.search(pattern);

        if (result == -1 || (val < 1 || val > 60)) {   //valid value range = 1<=val<=60
            $('#report-interval span').show();
            $(intEl).addClass('invalid');
            isErr = true;
        }
        else {
            $('#report-interval span').hide();
            $(intEl).removeClass('invalid');
            isErr = false;
        }
    }
}

//whenever the checkbox is checked, set the value attribute to 'true', when it is unchecked send value as 'false'
function updateCheckboxValue(chkEl) {
    if (chkEl.checked) {
        $(chkEl).attr('value', 'true');
    }
    else {
        $(chkEl).after("<input type='hidden' name=" + chkEl.name + " value='false' />");
    }
}

//Enable or disable the perf reporting section based on whether the perf reporting flag is checked/unchecked
function updateReportInterval() {
    var reportIntEl = $("input[name='pg.nerv.PgMenConfiguration.reportInterval']")[0];
    var perfReportingEl = $("input[name='pg.nerv.PgMenConfiguration.perfDataEnabled'][type=checkbox]")[0];
    if (perfReportingEl.checked) {
        enableElement(0, reportIntEl);
    }
    else {
        disableElement(0, reportIntEl);
    }
}

