$(function () {

    $('input#dbEnable').click(function () {
        var enabled = this.checked;
        toggleSettings(enabled);
        $(this).attr('value', enabled);
    });
});

function toggleSettings(isEnabled) {
    var fields = $("input#perfEnabled, input#reportInterval, input#pubEvents");
    if (isEnabled) {
        fields.removeAttr('disabled').removeAttr('readonly');
    }
    else fields.attr('disabled', 'disabled').attr('readonly', 'readonly');
}