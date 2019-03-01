<script src="/assets/tinymce/tinymce.min.js"></script>
<script>
    tinymce.init({
        selector: 'textarea',
        plugins: 'print preview fullpage searchreplace autolink directionality visualblocks visualchars fullscreen image link media template codesample table charmap hr pagebreak nonbreaking anchor toc insertdatetime advlist lists wordcount imagetools textpattern help',
        toolbar: 'formatselect | bold italic strikethrough forecolor backcolor | link | alignleft aligncenter alignright alignjustify  | numlist bullist outdent indent  | removeformat',
        height: 400,
        codesample_languages: [
            {text: 'HTML/XML', value: 'markup'},
            {text: 'Bash', value: 'bash'},
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