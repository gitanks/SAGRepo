$(function () {
    //left right table styles added by cloudstreams.js don't apply to alias info table
    $("div.tokenAlias table td").each(function() {$(this).removeClass("left").removeClass("right")});

    //confirm alias delete
    $("a.delAliasLnk").click(function (e) {
        var aliasName = $(this).find(".delAliasName").text();
        var isDel = confirm(getmsg("delete.token.alias", aliasName));
        if (!isDel) {
             blockEvt(e);
        }
    });

});

