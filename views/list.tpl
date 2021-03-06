<!DOCTYPE html>
<html>

<head>
    <!-- Required meta tags-->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no, minimal-ui">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <!-- Your app title -->
    <title>question_list</title>
    <!-- Path to Framework7 iOS CSS theme styles-->
    <link rel="stylesheet" href="/static/Framework7-1.5.3/dist/css/framework7.ios.min.css">
    <!-- Path to Framework7 iOS related color styles -->
    <link rel="stylesheet" href="/static/Framework7-1.5.3/dist/css/framework7.ios.colors.min.css">
    <!-- Path to your custom app styles-->
    <link rel="stylesheet" href="/static/Framework7-1.5.3/dist/css/my-app.css">
    <link rel="stylesheet" href="/static/css/question_list.css">

</head>

<body>
    <!-- Status bar overlay for full screen mode (PhoneGap) -->
    <div class="statusbar-overlay"></div>
    <!-- Panels overlay-->
    <div class="panel-overlay"></div>
    <!-- Left panel with reveal effect-->
    <div class="panel panel-left panel-reveal">
        <div class="content-block">
            <p>Left panel content goes here</p>
        </div>
    </div>
    <!-- Views -->
    <div class="views">
        <!-- Your main view, should have "view-main" class -->
        <div class="view view-main">
            <div data-page="searchbar" class="page page-on-center">
                <div class="searchbar-overlay"></div>
                <div class="page-content" style="background-color: #fff">
                    <div class="list-block search-here searchbar-found" style="margin-top: 0px;margin-bottom: 0px;padding-top: 0px;">
                        <!--搜索框下的内容-->
                        <div class="mod-qlist">
                            <h3 class="list-title3" style="color: #000;margin-top: 10px"><<<.Typename>>></h3>
                            <hr>
                        </div>
                        <div class="mod-qlist">
                            <div class="label-box lbox-close nobg m-line-15" id="list" style="display:block">
                                <!--<script type="text/html" id="listTemplate">-->
                                <<<range $index,$item := .List>>>
                                <a class="label-item p-l-15 external" href="content?id=<<<$item.Id>>>">
                                    <div class="label-inner">
                                        <div class="item-arrow access-box m-r-15"></div>
                                        <div class="item-content"><<<$item.Title>>></div>
                                    </div>
                                </a>
                                <<<end>>>
                                <!--</script>-->
                            </div>

                        </div>
                    </div>
                </div>
                <!-- Bottom Toolbar-->
            </div>
        </div>
</body>

<!-- Path to Framework7 Library JS-->
<script type="text/javascript" src="/static/Framework7-1.5.3/dist/js/framework7.min.js"></script>
<!-- Path to your app js-->
<script type="text/javascript" src="/static/Framework7-1.5.3/dist/js/my-app.js"></script>

</html>