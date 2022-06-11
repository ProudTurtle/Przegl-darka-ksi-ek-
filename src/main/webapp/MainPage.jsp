<%--
  Created by IntelliJ IDEA.
  User: DESTIN
  Date: 25.05.2022
  Time: 22:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Strona Główna</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.datatables.net/1.12.0/js/jquery.dataTables.min.js"></script>
    <link rel="stylesheet" href="style.css">
</head>
<style>
    * {
        box-sizing: border-box;
    }
    body {
        margin: 0;
    }
    #main {
        display: flex;
        min-height: calc(100vh - 40vh);
    }
    #main > article {
        flex: 1;
    }
    #main > nav,
    #main > aside {
        flex: 0 0 20vw;
    }
    #main > nav {
        order: -1;
    }
    header, article, nav, aside {
        padding: 1em;
    }
    header {
        height: 20vh;
        font-size: xx-large;
        text-align: center;
    }

    article{
        align-content: center;
    }


</style>
<body class="text-white">
<header>Zadanie 6 z TPO</header>
<div id="main">
    <article>
        <div class="row d-flex justify-content-center">
            <button onclick="location.href='http://localhost:8080/demoServelet17_war_exploded/Get'" type="button" class="btn btn-secondary btn-lg btn-block"> Przejdź do listy książek</button></div>
    </article>
    <nav></nav>
    <aside></aside>
</div>

        <footer class="bg-dark text-center text-white">
            <!-- Grid container -->
            <div class="container p-4 pb-0">
                <!-- Section: Form -->
                <section class="">
                    <form action="">
                        <!--Grid row-->
                        <div class="row d-flex justify-content-center">
                            <!--Grid column-->
                            <div class="col-auto">
                                <p class="pt-2">
                                    <strong>Sign up for our newsletter</strong>
                                </p>
                            </div>
                            <!--Grid column-->

                            <!--Grid column-->
                            <div class="col-md-5 col-12">
                                <!-- Email input -->
                                <div class="form-outline form-white mb-4">
                                    <input type="email" id="form5Example2" class="form-control" />
                                    <label class="form-label" for="form5Example2">Email address</label>
                                </div>
                            </div>
                            <!--Grid column-->
                            <!--Grid column-->
                            <div class="col-auto">
                                <!-- Submit button -->
                                <button type="submit" class="btn btn-outline-light mb-4">
                                    Subscribe
                                </button>
                            </div>
                            <!--Grid column-->
                        </div>
                        <!--Grid row-->
                    </form>
                </section>
                <!-- Section: Form -->
            </div>
            <!-- Grid container -->

            <!-- Copyright -->
            <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
                © 2022 Copyright:
                <a class="text-white">Aleksandra Wierzbicka</a>
            </div>
            <!-- Copyright -->
        </footer>


</body>
</html>
