
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><#if site_name??>${site_name}</#if> - powered by josense!</title>
    <meta name="description" content="<#if site_description??>${site_description}</#if>" />
    <link href="/rss" rel="alternate" type="application/rss+xml" title="Hard Coder" />
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/css/bootstrap.min.css">
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
<header class="navbar navbar-static-top navbar-inverse" id="top" role="banner">
<div class="container">
    <div class="">
        <a href="/" class="navbar-brand"><#if site_name??>{{site_name}}</#if></a>
    </div>
<nav class="collapse navbar-collapse " role="navigation">
    <ul class="nav navbar-nav">
        <li class="active"><a href="/">Home</a></li>
        <li><a href="/about">About</a></li>
    </ul>
<ul class="nav navbar-nav navbar-right">
<li>
<#if username??>
    <div style="color:white">
        Welcome ${username}
        <a href="/admin">Dashboard</a>
        <a href="/admin/addblog">Add blog</a>
        <a href="/logout">Logout</a>
    </div>
<#else>
    <div> <a href="/login">Login</a> </div>
</#if>
    <form action="/search" method="get" style="margin-top:10px">
        <input name="keyword"><input type="submit" value="Search" class="btn btn-primary" style="margin:0px 10px">
    </form>
</li>
</ul>
</nav>
</div>
</header>
<div class="container">
    <div class="content">
        <ul class="blog-list">
            <#if result??>
            <#list result as r>
                <li><a href="/view/{{ aid }}">${r.title}</a> Views(${r.views})</li>
            </#list>
            </#if>
        </ul>
        <div class="txtcenter">

            <div class="paginav">
                <div style="float:left;width:150px;text-align:center"><a href="/?page=<#if next_page??>${next_page}</#if>">Next page</a></div>
                <div style="float:left;width:150px;text-align:center"><a href="/?page=<#if prev_page??>${prev_page}</#if>">Previous Page</a></div>
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
