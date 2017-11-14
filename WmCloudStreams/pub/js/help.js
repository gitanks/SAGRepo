function setDocPage(docUrl) {
    var helpLnk = $("#helpUrl", parent.frames.topmenu.document);
    if (helpLnk) {
        helpLnk.attr('href', docUrl);
    }
}

