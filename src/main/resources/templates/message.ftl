<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><#if message??>${message}</#if></title>
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assets/css/default.css">
    <#include "ga.ftl">
</head>
<body>
<#include "header.ftl">
<div class="container mainBody">
    <div class="content">
        <div class="txtcenter">
            <p><#if message??>${message}</#if></p>
            <p><#if url??>
                <a href="${url}">Ok</a>
                </#if>
            </p>
        </div>
    </div>
</div>

<#include "donate.ftl">

</body>
</html>