<!DOCTYPE html>
<html>
<head>
    <title>Powered by josense!</title>
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assets/css/default.css">
    <#include "tinymce.ftl">
</head>
<body>

<#include "../header.ftl">
<div class="container">
<form action="/admin/save-edit" method="post" enctype="multipart/form-data" class="form-horizontal" role="form">
    <div class="form-group"><label>Title:</label><input name="title" class="form-control" value="<#if result.title??>${result.title}</#if>"></div>
    <div class="form-group">
        <label>Content:</label>
        <textarea name="content" class="form-control" style="height:500px"><#if result.content??>${result.content}</#if></textarea></div>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <input type="hidden" name="aid" value="<#if result.aid??>${result.aid?long?c}</#if>">
              <#if _csrf??>
            <input type="hidden" name="${_csrf.parameterName}"
                   value="${_csrf.token}" />
              </#if>
            <button type="submit">Save</button>
        </div>
    </div>
</form>
</div>
</body>
</html>
