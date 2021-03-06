
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Powered by josense!</title>
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assets/css/default.css">
    <style>
        .paginav {
            width:100%;
            height:24px;
            margin:20px 40px;
            display:block;
            clear:both;
        }
    </style>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>

<#include "../header.ftl">
<div class="container mainBody">
    <div class="content">
        <ul class="blog-list">
 <#if result??>
     <#list result as r>
                <li><a href="/view/${r.aid?long?c}">${r.title}</a> Views(${r.views})
                    [<a href="/admin/editblog/${r.aid?long?c}">Edit</a>] [<a href="/admin/deleteblog/${r.aid?long?c}">Delete</a>]
                </li>
     </#list>
 </#if>

        </ul>
        <div class="txtcenter">


            <div class="paginav">
                <div style="float:left;width:150px;text-align:center"><a href="/?page=<#if nextPage??>${nextPage?long?c}</#if>">Next page</a></div>
                <div style="float:left;width:150px;text-align:center"><a href="/?page=<#if prevPage??>${prevPage?long?c}</#if>">Previous Page</a></div>
            </div>


        </div>
        <div class="txtcenter">
            Links:
            <a href="http://www.coderbolg.com/" target="_blank">coderbolg</a> |
            <a href="http://www.hostloc.com" target="_blank">hostloc</a> |
            <a href="http://www.veryide.com/" target="_blank">VeryIDE</a> |
            <a href="http://www.esobeauty.com" target="_blank">妍淑秀丽</a> |
        </div>
        <div class="clearfix h10"></div>
        <div class="txtcenter">Follow me: <a href="http://weibo.com/netroby">@weibo</a> <a href="http://twitter.com/netroby">@twitter</a> <a href="https://github.com/netroby">@github</a>
        </div>
        <div class="txtcenter">Scan QR code and Donate me via alipay:<br/><img src="/assets/images/alipayme.jpg" style="width:72px;height:72px" alt="donate me via alipay"></div>
        <div class="clearfix h10"></div>
        <div class="txtcenter">Powered by <a href="//github.com/netroby/josense">josense</a></div>
    </div>
</div>
<script>
    (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
        (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
            m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
    })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

    ga('create', 'UA-4450773-12', 'auto');
    ga('send', 'pageview');
</script>
</body>
</html>
