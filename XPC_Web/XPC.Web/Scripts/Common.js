
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
                    myTimer = setTimeout("showNext()", 3000);
                    $(this).css({ 'display': 'none', 'z-index': 1 })
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
    myTimer = setTimeout("showNext()", 3000);
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
    
});

function LoadImage(id, src) {
    id.src = src;
    id.onerror = null;
}


function ActiveMenu(item) {
    $("#" + item).addClass("active");
}