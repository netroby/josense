
<header class="navbar navbar-static-top navbar-inverse" id="top" role="banner">
    <div class="container">
        <div class="">
            <a href="/" class="navbar-brand"><#if site_name??>{{site_name}}</#if></a>
        </div>
        <nav class="collapse navbar-collapse " role="navigation">
            <ul class="nav navbar-nav">
                <li class="active"><a href="/">Home</a></li>
                <li><a href="/about">About</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li>
                <#if isAuthenticated?? && isAuthenticated == true>
    <div style="color:white">
        Welcome ${username}
        <a href="/admin">Dashboard</a>
        <a href="/admin/add">Add blog</a>
        <a href="/logout">Logout</a>
    </div>
                <#else>
    <div> <a href="/login">Login</a> </div>
                </#if>
                    <form action="/search" method="get" style="margin-top:10px">
                        <input name="keyword"><input type="submit" value="Search" class="btn btn-primary" style="margin:0px 10px">
                    </form>
                </li>
            </ul>
        </nav>
    </div>
</header>