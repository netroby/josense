<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><#if site_name??>${site_name}</#if> - powered by josense!</title>
    <meta name="description" content="<#if site_description??>${site_description}</#if>" />
    <link href="/rss" rel="alternate" type="application/rss+xml" title="Hard Coder" />
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assets/css/default.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <#include "ga.ftl">
</head>
<body>
<header class="navbar navbar-static-top navbar-inverse" id="top" role="banner">
<div class="container">
    <div class="">
        <a href="/" class="navbar-brand"><#if site_name??>${site_name}</#if></a>
    </div>
<nav class="collapse navbar-collapse " role="navigation">
    <ul class="nav navbar-nav">
        <li><a href="/">Home</a></li>
        <li class="active"><a href="/about">About</a></li>
    </ul>
<ul class="nav navbar-nav navbar-right">
<li>
<#if isAuthenticated??>
    <div style="color:white">
        Welcome ${username}
        <a href="/admin/add">Add blog</a>
        <a href="/logout">Logout</a>
    </div>
<#else>
    <div> Welcome </div>
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
        <h2>About me</h2>
        <p>Write codes, since 2002.</p>
        <p>Linux/FreeBSD lover，Open source lover.Now write PHP,Go lang, C/CPP. Know a bit about Erlang, JAVA, Scala,Haskell,Ocaml,Python,Ruby,Lua Interest at Rust Lang.</p>
        <h2>Contact</h2>
        <p>netroby#netroby[dot]com</p>
        <p><a href="//t.me/netroby">t.me/netroby</a></p>
        <div class="clearfix h10"></div>
    </div>
</div>
<#include "donate.ftl">
</body>
</html>
