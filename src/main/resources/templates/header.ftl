<nav class="navbar navbar-expand-lg navbar-dark bg-dark navbar-static-top navbar-inverse">
    <div class="container d-flex justify-content-between">

        <a href="/" class="navbar-brand"><#if siteName??>${siteName}</#if></a>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item <#if homeActive??>active</#if>"><a class="nav-link" href="/">Home</a></li>
                <li class="nav-item <#if aboutActive??>active</#if>"><a class="nav-link" href="/about">About</a></li>
            </ul>

            <div class="navbar-text">
                <#if isAuthenticated?? && isAuthenticated == true>
                    Welcome ${username}
                    <a href="/admin">Dashboard</a>
                    <a href="/admin/add">Add blog</a>
                    <a href="/logout">Logout</a>
                <#else>
                    <a href="/login">Login</a>
                </#if>
            </div>
            <form action="/search" method="get" class="form-inline my-2 my-lg-0" style="margin-top:10px">
                <input name="keyword"><input type="submit" value="Search" class="btn btn-primary"
                                             style="margin:0px 10px">
            </form>
        </div>
    </div>
</nav>
