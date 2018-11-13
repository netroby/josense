{{$_csrf.token}}
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>{{#with result}}{{ title }}{{/with}} {{ site_name }} powered by josense!</title>
    <meta name="description" content="{{site_description}}" />
    <meta name="description" content="{{site_description}}" />
    <link href="/rss" rel="alternate" type="application/rss+xml" title="Hard Coder" />
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.4/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assets/css/default.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">    
{{> ga }}
</head>
<body>
<header class="navbar navbar-static-top navbar-inverse" id="top" role="banner">
    <div class="container">
        <div class="">
            <a href="/" class="navbar-brand">{{ site_name }}</a>
        </div>
        <nav class="collapse navbar-collapse " role="navigation">
            <ul class="nav navbar-nav">
            <li class="active"><a href="/">Home</a></li>
            <li><a href="/about">About</a></li>
        </ul>
            <ul class="nav navbar-nav navbar-right">
                <li>
                    {{#if username }}
                    <div style="color:white">
                        Welcome {{ username }}
                        <a href="/admin">Dashboard</a>
                        <a href="/admin/addblog">Add blog</a>
                        <a href="/admin/logout">Logout</a>
                    </div>
                    {{else}}
                    <div> Welcome </div>
                    {{/if}}
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
            {{#with _csrf}}
            <input type="hidden" name="{{parameterName}}"
                   value="{{token}}" />
            {{/with}}
        </form>
    </div>
</div>

{{> donate}}
<script src="https://cdn.rawgit.com/google/code-prettify/master/loader/run_prettify.js"></script>
</body>
</html>
