<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><#if title??>${title}</#if> <#if site_name??>${site_name}</#if> powered by josense!</title>
    <meta name="description" content="<#if site_description??>${site_description}</#if>" />
    <link href="/rss" rel="alternate" type="application/rss+xml" title="Hard Coder" />
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.4/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assets/css/default.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">    
<#include "ga.ftl">
</head>
<body>

<#include "header.ftl">
<div class="container">
    <div class="content">
        <form action="/login" method="post">
            <div class="form-group">
                <label for="username">User Name: </label>
                <input type="text" class="form-control" id="username" placeholder="Enter UserName" name="username"/>
            </div>
            <div class="form-group">
                <label for="password">Password: </label>
                <input type="password" class="form-control" id="password" placeholder="Enter Password" name="password"/>
            </div>
            <button type="submit" class="btn btn-primary btn-block">Submit</button>
            <#if _csrf??>
            <input type="hidden" name="${_csrf.parameterName}"
                   value="${_csrf.token}" />
            </#if>
        </form>
    </div>
</div>

<#include "donate.ftl">
<script src="https://cdn.rawgit.com/google/code-prettify/master/loader/run_prettify.js"></script>
</body>
</html>
