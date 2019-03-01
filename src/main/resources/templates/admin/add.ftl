<!DOCTYPE html>
<html>
<head>
    <title>powered by josense!</title>
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assets/css/default.css">
    <#include "tinymce.ftl">
</head>
<body>

<#include "../header.ftl">
<div class="container">
    <div style="float:right"><a href="/admin/files" target="_blank">Files &amp; Upload</a></div>
    <form action="/admin/save-add" method="post" enctype="multipart/form-data" class="form-horizontal" role="form">
        <div class="form-group"><label>Title:</label><input name="title" class="form-control"></div>
        <div class="form-group">
            <label>Content:</label>
            <textarea name="content" class="form-control" style="height:500px"></textarea></div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
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
