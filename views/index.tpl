<!DOCTYPE html>
<html>

<head>
    <!-- Required meta tags-->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no, minimal-ui">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <!-- Your app title -->
    <title>掌上理工大反馈</title>
    <!-- Path to Framework7 iOS CSS theme styles-->
    <link rel="stylesheet" href="/static/Framework7-1.5.3/dist/css/framework7.ios.min.css">
    <!-- Path to Framework7 iOS related color styles -->
    <link rel="stylesheet" href="/static/Framework7-1.5.3/dist/css/framework7.ios.colors.min.css">
    <!-- Path to your custom app styles-->
    <link rel="stylesheet" href="/static/Framework7-1.5.3/dist/css/my-app.css">
    <link rel="stylesheet" href="/static/css/question_index.css">
</head>

<body>
    <!-- Views -->
    <div class="views">
        <!-- Your main view, should have "view-main" class -->
        <div class="view view-main">
            <div data-page="feedback" class="page page-on-center">
                <form data-search-list=".search-here" data-search-in=".item-title" class="searchbar searchbar-init">
                    <div class="searchbar-input">
                        <input type="search" id="searchvalue" placeholder="搜索" id="searchbar" class="">
                        <a href="#" class="searchbar-clear"></a>
                    </div>
                    <a href="#" class="searchbar-cancel" style="display: block; margin-right: -53px;font-size: 1.1em;color: #ffffff;">取消</a>
                </form>
                <div class="searchbar-overlay"></div>
                <div class="page-content" style="background-color: #fff">
                    <!--
                    <script type="text/html" id="findTemplate">
                        {{range $index,$item := .data}}
                        <a class="label-item p-l-15 external" href="#">
                            <div class="label-inner">
                                <div class="item-arrow access-box m-r-15"></div>
                                <div class="item-content" style="color: #000000;border-bottom: solid 1px #e1e1df">{{$item.Title}}</div>
                            </div>
                        </a>
                        {{end}}
                    </script>
                    -->
                    <div id="find" class="list-block searchbar-not-found">
                    </div>

                    <div class="list-block search-here searchbar-found" id="default">
                        <!--搜索框下的内容-->
                        <div class="mod-qlist" style="margin-top: 0px;margin-bottom: 0px;padding-top: 15px;background: url(/static/img/bg-index@2x.png);-webkit-background-size:cover ;background-size: cover;">
                            <h3 class="list-title2">热点问题</h3>
                            <div class="label-box lbox-close nobg m-line-15" id="questionList">
                                <!--<script type="text/html" id="questionListTemplate">-->
                                {{range $index,$item := .List}}
                                <a class="label-item p-l-15 external" href="#">
                                    <div class="label-inner">
                                        <div class="item-arrow access-box m-r-15"></div>
                                        <div class="item-content">{{$item.Title}}</div>
                                    </div>
                                </a>
                                {{end}}
                                <!--</script>-->
                            </div>
                        </div>
                        <div class="mod-qlist">
                            <h3 class="list-title3" style="color: #000;margin-top: 10px">问题分类</h3>
                        </div>
                        <div class="label-box lbox-close" style="height: 220px;">
                            <div class="mod-img-qlist">
                                <a class="label-imgbox external" href="./list">
                                    <div class="qimg-box">
                                        <div class="icon1">
                                            <img src="/static/img/4.png">
                                        </div>
                                        <h3>登录</h3>
                                    </div>
                                </a>
                                <a class="label-imgbox external" href="./list">
                                    <div class="qimg-box">
                                        <div class="icon1">
                                            <img src="/static/img/3.png">
                                        </div>
                                        <h3>图书馆</h3>
                                    </div>
                                </a>
                                <a class="label-imgbox external" href="./list">
                                    <div class="qimg-box">
                                        <div class="icon1">
                                            <img src="/static/img/6.png">
                                        </div>
                                        <h3>成绩</h3>
                                    </div>
                                </a>
                                <a class="label-imgbox external" href="./list">
                                    <div class="qimg-box">
                                        <div class="icon">
                                            <img src="/static/img/1.png">
                                        </div>
                                        <h3>校园卡</h3>
                                    </div>
                                </a>
                                <a class="label-imgbox external" href="./list">
                                    <div class="qimg-box">
                                        <div class="icon">
                                            <img src="/static/img/2.png">
                                        </div>
                                        <h3>更多功能</h3>
                                    </div>
                                </a>
                                <a class="label-imgbox external" href="./list">
                                    <div class="qimg-box">
                                        <div class="icon">
                                            <img src="/static/img/5.png">
                                        </div>
                                        <h3>其它</h3>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <div class="btn-feed">
                            <a href="#">
                                <i class="icon-feed"></i>意见反馈</a>
                        </div>
                    </div>
                </div>
                <!-- Bottom Toolbar-->
            </div>
        </div>
    </div>
</body>


<!-- Path to Framework7 Library JS-->
<script type="text/javascript" src="/static/Framework7-1.5.3/dist/js/framework7.min.js"></script>
<!-- Path to your app js-->
<script type="text/javascript" src="/static/Framework7-1.5.3/dist/js/my-app.js"></script>
<script type="text/javascript" src="/static/js/jquery-1.11.0.js"></script>
<script type="text/javascript">
    $(function () {
        var findTemplate;
        $('#searchvalue').bind('change', function () {
            var obj = document.getElementById("searchvalue");
            var inputVal = $.trim(obj.value);
            $.ajax({
                type: "POST",
                url: "http://localhost:8080/index",
                data: {
                    "keyword": inputVal,
                },
                success: function (result) {
                    if (result.length == 0) {
                        return 0;
                    } else {
                        findTemplate = $$('#findTemplate').html();
                        $$('#find').html(Template7.compile(findTemplate)(result));
                    }
                }
            })
            if (inputVal == "") {
                $$("#find").hide();
                $$("#find").empty();
                $$("#default").show();
            } else {
                $$("#find").show();
                $$("#default").hide();
            }
        });

    })
</script>

</html>