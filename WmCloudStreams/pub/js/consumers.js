$(function () {

    //left right table styles added by cloudstreams.js don't apply to consumer info table
    $("div.consumer table td").each(function() {$(this).removeClass("left").removeClass("right")});

    //confirm consumer delete
    $("a.delConsumerLnk").click(function (e) {
        var consName = $(this).find(".consumerName").text();
        var isDel = confirm(getmsg('delete.consumer', consName));
        if (!isDel) {
             blockEvt(e);
        }
    });

});

