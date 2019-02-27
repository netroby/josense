<!DOCTYPE html>
<html>
<head>
    <title>Powered by josense!</title>
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assets/css/default.css">
    <script src="//cdnjs.cloudflare.com/ajax/libs/tinymce/4.2.7/tinymce.min.js"></script>
    <script type="text/javascript">
        tinymce.PluginManager.add('prettycode', function(editor, url) {
            // Add a button that opens a window
            editor.addButton('prettycode', {
                text: 'PrettyCode',
                icon: false,
                onclick: function() {
                    // Open window
                    editor.windowManager.open({
                        title: 'PrettyCode',
                        body: [
                            {
                            type: 'textbox',
                            name: 'sourcecode',
                            multiline: true,
                            minWidth: 600,
                            minHeight: 500
                            }
                        ],
                        onsubmit: function(e) {
                            // Insert content when the window form is submitted
                            editor.insertContent('<pre class="prettyprint">' + e.data.sourcecode + '</pre>');
                        }
                    });
                }
            });
        });
    </script>
    <script>
        tinymce.init({
            selector: "textarea",
            theme: "modern",
            plugins: [
                "advlist autolink lists link image charmap print preview hr anchor pagebreak",
                "searchreplace wordcount visualblocks visualchars fullscreen",
                "nonbreaking save table contextmenu directionality",
                "template paste textcolor colorpicker textpattern prettycode code"
            ],
            toolbar1: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | prettycode link image |  forecolor backcolor ",
            image_advtab: true,
            extended_valid_elements : "pre[class],img[class|src|border=0|alt|title|hspace|vspace|width|height|align|onmouseover|onmouseout|name]"
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
