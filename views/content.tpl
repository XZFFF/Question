<!DOCTYPE html>
<html>

<head>
    <!-- Required meta tags-->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no, minimal-ui">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <!-- Your app title -->
    <title>问题详情</title>
    <!-- Path to Framework7 iOS CSS theme styles-->
    <link rel="stylesheet" href="/static/Framework7-1.5.3/dist/css/framework7.ios.min.css">
    <!-- Path to Framework7 iOS related color styles -->
    <link rel="stylesheet" href="/static/Framework7-1.5.3/dist/css/framework7.ios.colors.min.css">
    <!-- Path to your custom app styles-->
    <link rel="stylesheet" href="/static/Framework7-1.5.3/dist/css/my-app.css">
    <link rel="stylesheet" href="/static/css/question_content.css">
</head>

<body>
    <!-- Views -->
    <div class="views">
        <!-- Your main view, should have "view-main" class -->
        <div class="view view-main">
            <div class="detail-box" id="cont">
                <h2 class="q-title">
                    <<<.Question.Title>>></h2>
                <div class="q-content">
                    <div>
                        <div style="line-height: 21px;">
                            <<<str2html .Question.Content>>>
                        </div>
                    </div>
                </div>
                <div class="praise">
                    <div class="result wx" id="feedback_b">
                        <a onclick="feedback(1)" id="yes" class="external">
                            <i class="icon-like"></i>已解决</a>
                        <a onclick="feedback(0)" id="no" class="external">
                            <i class="icon-repost"></i>未解决</a>
                    </div>
                    <div class="result wx" id="feedback_b_z" style="display:none">
                        <a class="current acive external">
                            <i class="icon-like"></i>已解决</a>
                        <a>
                            <i class="icon-repost external"></i>未解决</a>
                    </div>
                    <div class="result wx" id="feedback_b_z_c" style="display:none">
                        <a>
                            <i class="icon-like external"></i>已解决</a>
                        <a class="current acive external">
                            <i class="icon-repost"></i>未解决</a>
                    </div>
                    <button onclick="abc()">点我点我！</button>
                </div>
            </div>
        </div>
    </div>
</body>
<script>
function abc() {
    alert("success");
}
</script>
<script type="text/javascript">
    var id = 0;
    var url = window.location.search;
    var like_type = "like";
    id = url.substring(url.lastIndexOf('=') + 1, url.length);
    console.log("id=" + id);

    function feedback(c) {
        console.log("click: " + c)
        document.getElementById("feedback_b").style.display = 'none';
        if (c == 1) {
            document.getElementById("feedback_b_z").style.display = 'block';
            like_type = "like";
        }
        if (c == 0) {
            document.getElementById("feedback_b_z_c").style.display = 'block';
            like_type = "dislike";
        }
        $.ajax({
            type: "POST",
            url: "http://localhost:8080/content.html",
            data: {
                "id": id "like_type": like_type,
            }
        })
    }
</script>
<!-- Path to Framework7 Library JS-->
<script type="text/javascript" src="/static/Framework7-1.5.3/dist/js/framework7.min.js"></script>
<!-- Path to your app js-->
<script type="text/javascript" src="/static/Framework7-1.5.3/dist/js/my-app.js"></script>
<script type="text/javascript" src="/static/js/jquery-1.11.0.js"></script>


</html>