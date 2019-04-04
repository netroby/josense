
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><#if siteName??>${siteName}</#if> - powered by josense!</title>
    <meta name="description" content="<#if siteDescription??>${siteDescription}</#if>" />
    <link href="/rss" rel="alternate" type="application/rss+xml" title="Hard Coder" />
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
    <#include "ga.ftl">
</head>
<body>
<#include "header.ftl">
<div class="container">
    <div class="content">
        <ul class="blog-list">
            <#if result??>
            <#list result as r>
                <li><a href="/view/${r.aid?long?c}">${r.title}</a> Views(${r.views})</li>
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
            <a href="http://www.hostloc.com" target="_blank">hostloc</a> |
            <a href="http://www.veryide.com/" target="_blank">VeryIDE</a>
        </div>
    </div>
</div>

<#include "donate.ftl">
</body>
</html>
