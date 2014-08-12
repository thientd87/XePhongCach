<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HomeVote.ascx.cs" Inherits="XPC.Web.GUI.HomeVote" %>
  <div id="other">
        <div id="top-thuxe" class="cate_vertical_thamdo">
            <h2>
                <a class="tab-news" href="http://xevaphongcach.net/#">Thăm dò ý kiến</a>            
            </h2>
            <div class="list-news">
                <p>Bạn biết đến Website Xe&amp;phongcach thông qua thông tin nào ?</p><form action="http://xevaphongcach.net/polls/process_poll/1" id="poll_submit_form" method="post" accept-charset="utf-8">
    <input type="hidden" name="poll_id" value="1">
    <p><input type="radio" name="ans_id" value="0"> <label for="Internet">Internet</label></p><p><input type="radio" name="ans_id" value="1"> <label for="Truyền hình">Truyền hình</label></p><p><input type="radio" name="ans_id" value="2"> <label for="Bạn bè">Bạn bè</label></p><button name="mysubmit" type="button" id="poll_submit">Biểu quyết</button><button name="myresult" type="button" id="poll_result">Kết quả</button></form>     
            </div><!--end of .list-news-->
        </div><!--end of #top-thuxe-->
    
                    
    </div>
<!--end of #other-->

    <script>
        jq171("#poll_submit").click(function () {
            poll_id = jq171("input[name='poll_id']").val();
            ans_id = jq171("input[name='ans_id']:checked").val();
            var request = jq171.ajax({
                url: "http://xevaphongcach.net/polls/process_poll" + "/" + poll_id,
                type: "POST",
                data: { poll_id: poll_id, ans_id: ans_id },
                dataType: "html"
            });
            request.done(function (msg) {
                alert(msg);
            });
            request.fail(function (jqXHR, textStatus) {
                alert("Request failed: " + textStatus);
            });
            return false;
        });
        jq171("#poll_result").click(function () {
            window.open("http://xevaphongcach.net/polls/process_result", '_blank', 'width=600, height=500');
            return false;
        });
    </script>