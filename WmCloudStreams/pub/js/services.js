$(function() {

    //use jquery "on" to delegate event handling; these selectors match
    //in future when the virtual services tab is clicked and content is added dynamically
    $(document).on('click', 'form a.vsd', function() {
        $(this).parent('form').submit();
    });

    $(document).on('submit', 'form.serviceDetails', function() {
        popupform(this, 'Source');
    });

    $("#tabs").tabs();

    $('div.service:last').css('border-bottom', 'none');
    //left right table styles added by cloudstreams.js don't apply to consumer info table
    $("div.service table td").each(function() {$(this).removeClass("left").removeClass("right")});

});

function popupform(myform, windowname)
{
    if (! window.focus) return true;
    window.open('', windowname, 'width=900, height=600,scrollbars=yes');
    myform.target = windowname;
    return true;
}

