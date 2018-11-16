<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><#if title??>${title}</#if> - powered by josense!</title>
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
                <li class="active"><a href="/">Home</a></li>
                <li><a href="/about">About</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <#if isAuthenticated??>
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
                        <input name="keyword" value="<#if keyword??>${keyword}</#if>"><input type="submit" value="Search" class="btn btn-primary" style="margin:0px 10px">
                    </form>
                </li>
            </ul>
        </nav>
    </div>
</header>
<div class="container">
    <div class="content">
        <#if result??>
        <div class="blog-title-box">
            <h2 id="blog-title"><#if result.title??>${result.title}</#if></h2>
        </div>
        <div class="blog-body">
          <#if result.content??>${result.content}</#if></div>
        <div class="blog-orig">
            <p>Post: <#if result.publish_time??>${result.publish_time}</#if></p>
            <p>Views: <#if result.views??>${result.views}</#if></p>
            <#if username??>
            <p><a href="/admin/editblog/<#if aid??>${aid}</#if>">Edit blog</a></p>
            </#if>
        </div>
            </#if>
        <div class="clearfix h10"></div>
        <div class="addthis_sharing_toolbox"></div>
        <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-514ff8081944d017" async="async"></script>
        <div class="clearfix h10"></div>
        <div id="disqus_thread"></div>
        <script type="text/javascript">
            /* * * CONFIGURATION VARIABLES * * */
            var disqus_shortname = 'netroby';

            /* * * DON'T EDIT BELOW THIS LINE * * */
            (function() {
                var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
                dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
                (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
            })();
        </script>
        <noscript>Please enable JavaScript to view the <a href="https://disqus.com/?ref_noscript" rel="nofollow">comments powered by Disqus.</a></noscript>
        <div class="clearfix h10"></div>
    </div>
</div>

<#include "donate.ftl">
<script src="https://cdn.rawgit.com/google/code-prettify/master/loader/run_prettify.js"></script>
</body>
</html>
