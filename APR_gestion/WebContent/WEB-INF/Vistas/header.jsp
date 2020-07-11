<header class="bg-dark dk header navbar navbar-fixed-top-xs">

    <div class="navbar-header aside-md">
    
        <a class="btn btn-link visible-xs" data-toggle="class:nav-off-screen,open" data-target="#nav,html">
            <i class="fa fa-bars"></i>
            
        </a>
        
        <a href="#" class="navbar-brand" data-toggle="fullscreen"><img src="https://media3.giphy.com/media/jsnNSCTGgktYA/200w.webp?cid=ecf05e47ea313c320889547dabf3f8a9805b20ecf38e7995&rid=200w.webp" class="m-r-sm">APR - Gestion</a>
        <a class="btn btn-link visible-xs" data-toggle="dropdown" data-target=".nav-user">
        
            <i class="fa fa-cog"></i>
        </a>
        
    </div>

    <ul class="nav navbar-nav navbar-right m-n hidden-xs nav-user">
    
        <li class="dropdown">
        
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
            
                <span class="thumb-sm avatar pull-left">
                    <img src="https://www.vippng.com/png/detail/355-3554387_create-digital-profile-icon-blue-profile-icon-png.png">
                </span>
                <%= session.getAttribute("usuario") %> <b class="caret"></b>
            </a>
            
            <ul class="dropdown-menu animated fadeInRight">
                <span class="arrow top"> Acciones </span>
                <li>
                    <a href="#">Settings</a>
                </li>
                <li>
                    <a href="profile.html">Profile</a>
                </li>
                <li>
                    <a href="#">
                        <span class="badge bg-danger pull-right">3</span>
                        Notifications
                    </a>
                </li>
                <li>
                    <a href="docs.html">Help</a>
                </li>
                <li class="divider"></li>
                <li>
                    <a href="modal.lockme.html" data-toggle="ajaxModal">Logout</a>
                </li>
            </ul>
        </li>
    </ul>
</header>