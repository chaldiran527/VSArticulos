<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogIn.aspx.cs" Inherits="Artículos.LogIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="Content/bootstrap-reboot.min.css" rel="stylesheet" />
    <link href="StyleSheet1.css" rel="stylesheet"/>
</head>
<body>
    <form id="form1" runat="server">
        <header class="header">
            <nav class="navbar navbar-expand-lg px-4 py-4 bg-white shadow">

            </nav>
        </header>
        <div class="page-holder w-100 d-flex flex-wrap">
            <div class="container-fluid px-x1-5">
                <section class="py-5">
                    <div class="row">

                        <div class="col-lg-5">
                            <div class="card">
                                <div class="card-header">
                                    <h3 class="h6 text-uppercase mb-0">Already have an account login here</h3>
                                </div>
                                <div class="card-body">
                                    <a href="#" type="button" class="btn btn-outline-primary" role="button">Login</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-5">
                            <div class="card">
                                <div class="card-header">
                                    <h3 class="h6 text-uppercase mb-0">Don't have an account here</h3>
                                </div>
                                <div class="card-body">
                                    <a href="#" type="button" class="btn btn-primary">Sign up</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </form>
</body>
</html>
