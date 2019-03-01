<!DOCTYPE html>
<html>
<head>
    <title>Powered by josense!</title>
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assets/css/default.css">
    <script src="/assets/tinymce/tinymce.min.js"></script>
    <script>
        tinymce.init({
            selector: 'textarea',
            plugins: 'print preview fullpage searchreplace autolink directionality visualblocks visualchars fullscreen image link media template codesample table charmap hr pagebreak nonbreaking anchor toc insertdatetime advlist lists wordcount imagetools textpattern help',
            toolbar: 'formatselect | bold italic strikethrough forecolor backcolor | link | alignleft aligncenter alignright alignjustify  | numlist bullist outdent indent  | removeformat',
            height: 400,
            codesample_languages: [
                {text: 'HTML/XML', value: 'markup'},
                {text: 'JavaScript', value: 'javascript'},
                {text: 'CSS', value: 'css'},
                {text: 'PHP', value: 'php'},
                {text: 'Golang', value: 'go'},
                {text: 'Ruby', value: 'ruby'},
                {text: 'Python', value: 'python'},
                {text: 'Perl', value: 'perl'},
                {text: 'Julia', value: 'julia'},
                {text: 'ocaml', value: 'ocaml'},
                {text: 'objectivec', value: 'objectivec'},
                {text: 'r', value: 'r'},
                {text: 'swift', value: 'swift'},
                {text: 'kotlin', value: 'kotlin'},
                {text: 'lua', value: 'lua'},
                {text: 'yaml', value: 'yaml'},
                {text: 'Java', value: 'java'},
                {text: 'C', value: 'c'},
                {text: 'C#', value: 'csharp'},
                {text: 'C++', value: 'cpp'}
            ]
        });
    </script>
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
