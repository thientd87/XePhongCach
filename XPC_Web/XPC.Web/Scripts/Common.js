
var currentImage;
var currentIndex = -1;
var interval;
function showImage(index) {
    if (index < $('#bigPic .pic').length) {
        var indexImage = $('#bigPic .pic')[index];
        if (currentImage) {
            if (currentImage != indexImage) {
                $(currentImage).css('z-index', 2);
                clearTimeout(myTimer);
                $(currentImage).fadeOut(250, function () {
                    myTimer = setTimeout("showNext()", 5000);
                    $(this).css({ 'display': 'none', 'z-index': 1 });
                });
            }
        }
        $(indexImage).css({ 'display': 'block', 'opacity': 1 });
        currentImage = indexImage;
        currentIndex = index;
        $('#thumbs li').removeClass('active');
        $($('#thumbs li')[index]).addClass('active');
    }
}

function showNext() {
    var len = $('#bigPic .pic').length;
    var next = currentIndex < (len - 1) ? currentIndex + 1 : 0;
    showImage(next);
}

var myTimer;

$(document).ready(function () {
    myTimer = setTimeout("showNext()", 5000);
    showNext(); //loads first image
    $('#thumbs li').bind('mouseenter', function (e) {
        var count = $(this).attr('rel');
        showImage(parseInt(count) - 1);
    });
    $('.cate_horizontal_home p.sum').ellipsis({
        row: 4
        
    });
    $('.cate_vertical_home p.sum').ellipsis({
        row: 2
        
    });
    
    var mytime = setTimeout('display_ct()', 1000);
});

function LoadImage(id, src) {
    id.src = src;
    id.onerror = null;
}


function ActiveMenu(item) {
    $("#" + item).addClass("active");
}

(function ($) {
    // VERTICALLY ALIGN FUNCTION
    $.fn.vAlign = function () {
        return this.each(function (i) {
            var ah = $(this).height();
            var ph = $(this).parent().height();
            var mh = (ph - ah) / 2;
            $(this).css('margin-top', mh);
        });
    };
})(jQuery);


function adjustHeights() {
    var max = 0;
    var len;
    for (var i = 0; i < arguments.length; i++) {
        len = $('#' + arguments[i]).outerHeight();
        if (len > max) { max = len; }
    }
    var pad = 0;
    var bor = 0;
    for (var i = 0; i < arguments.length; i++) {
        pad = parseInt($('#' + arguments[i]).css("padding-top"), 10) + parseInt($('#' + arguments[i]).css("padding-bottom"), 10);
        $('#' + arguments[i]).height(max - pad);
    }
}

function ValidateSearch() {
    if (!require_txt("txtSearchBox", "Bạn chưa nhập từ khóa")) return false;
    key = removeHTMLTags("txtSearchBox");
    window.location = '/Pages/SearchResult.aspx?key=' + key;
    return false;
}
function TDTEnterPressSearch(e) {
    var characterCode;
    if (e && e.which)
    { e = e; characterCode = e.which; }
    else
    { e = window.event; characterCode = e.keyCode; }
    if (characterCode == 13)
    { ValidateSearch(); return false; }
    return true;
}
function removeHTMLTags(ctrID) {

    var strInputCode = document.getElementById(ctrID).value;

    strInputCode = strInputCode.replace(/&(lt|gt);/g, function (strMatch, p1) {
        return (p1 == "lt") ? "<" : ">";
    });
    var strTagStrippedText = strInputCode.replace(/<\/?[^>]+(>|$)/g, "");
    while (strTagStrippedText.indexOf('"') != -1)
        strTagStrippedText = strTagStrippedText.replace('"', '');
    //    while (strTagStrippedText.indexOf('\'') != -1)
    //        strTagStrippedText = strTagStrippedText.replace('\'', '');
    document.getElementById(ctrID).value = strTagStrippedText;
    return strTagStrippedText;



}

function require_txt(control, msg) {
    if (document.getElementById(control).value == "") {
        alert(msg);
        document.getElementById(control).focus();
        return false;
    }
    return true;
}


function display_ct() {
   // var strcount;
    var x = new Date();
   // var x1 = x.toUTCString();// changing the display to UTC string
    $(".clock").html(x.toLocaleDateString() + ' | ' + x.toLocaleTimeString());
   // tt = display_c();
}

function display_c() {
    var refresh = 1000; // Refresh rate in milli seconds
    mytime = setTimeout('display_ct()', refresh);
}