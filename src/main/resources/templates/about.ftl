<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><#if siteName??>${siteName}</#if> - powered by josense!</title>
    <meta name="description" content="<#if siteDescription??>${siteDescription}</#if>" />
    <link href="/rss" rel="alternate" type="application/rss+xml" title="Hard Coder" />
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assets/css/default.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <#include "ga.ftl">
</head>
<body>
<#include "header.ftl">
<div class="container mainBody">
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
