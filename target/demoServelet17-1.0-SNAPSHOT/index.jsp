<%@ page import="pjatk.Book" %>
<%@ page import="java.util.List" %>
<%@ page import="pjatk.Service" %>
<%@ page import="java.util.Objects" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String filterTitle = request.getParameter("title");
    String filterGenre = request.getParameter("genre");
    String filterAuthor = request.getParameter("author");
    String filterPrice1 = request.getParameter("cenaod");
    String filterPrice2 = request.getParameter("cenado");

    Service rep = new Service();
    List<Book> books;
    if(filterTitle == null && filterGenre == null)
        books= rep.getBooksFromDb();
    else books =  rep.getBooks(filterTitle,filterGenre,filterAuthor, filterPrice1, filterPrice2);

    List<String> genres = rep.getGenres();
    List<String> authors = rep.getAuthors();

%>
<!DOCTYPE html>
<html>
<head>
    <title>Baza książek</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap5.min.css">
    <link rel="stylesheet" href="style.css">
    <script
            src="https://code.jquery.com/jquery-3.6.0.slim.js"
            integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY="
            crossorigin="anonymous"></script>
    <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script>
</head>

<body>

<div class="container-fluid py-4">
    <div class="content m-4 p-4">
        <h1><%= "Twoja wirtualna baza książek!" %></h1>

        <hr/>

        <form action="" method="get">
            <label>
                <span>Tytuł:</span>

                <input type="text" name="title" class="form-control"
                       <% if(filterTitle == null) %> value=""
                       <% if(filterTitle != null) %> value="<%= filterTitle%>"/>
            </label>

            <label>
                <span>Gatunek:</span>
                <select class="form-control" name="genre">
                    <option value="">All</option>
                    <% for (String genre : genres) { %>
                    <option <%= Objects.equals(filterGenre, genre) ? "selected" : "" %>
                            value="<%= genre %>"><%= genre %>
                    </option>
                    <% } %>
                </select>
            </label>
            <label>
                <span>Autor:</span>
                <select class="form-control" name="author">
                    <option value="">All</option>
                    <% for (String author : authors) { %>
                    <option <%= Objects.equals(filterAuthor, author) ? "selected" : "" %>
                            value="<%= author %>"><%= author %>
                    </option>
                    <% } %>
                </select>
            </label>
            <label>
                <span>Cena od</span>
                <input type="text" name="cenaod" class="form-control"
                        <% if(filterPrice1 == null) %> value=""
                        <% if(filterPrice1 != null) %> value="<%= filterPrice1 %>" />
            </label>
            <label>
                <span>Cena do</span>
                <input type="text" name="cenado" class="form-control"
                        <% if(filterPrice2 == null) %> value=""
                        <% if(filterPrice2 != null) %> value="<%= filterPrice2%>" />
            </label>
            <input type="submit" class="btn btn-primary" value="Szukaj"/>
        </form>

        <hr/>

        <table id="dataTable" class="table table-hover">
            <thead>
            <tr>
                <th onclick="sortTable(0)">Tytuł</th>
                <th onclick="sortTable(1)">Gatunek</th>
                <th>Autor</th>
                <th>Cena</th>
                <th>Data Wydania</th>
            </tr>
            </thead>
            <tbody>
            <% for (Book book : books) { %>
            <tr>
                <td><%= book.getTitle()%>
                </td>
                <td><%= book.getGenre()%>
                </td>
                <td><%= book.getAuthor()%>
                </td>
                <td><%= book.getPrice()%>
                </td>
                <td><%= book.getDate()%>
                </td>
            </tr>
            <% } %>
            </tbody>
        </table>
    </div>
</div>
<% //TODO footer trzymający się na dole strony xD przycisk powrotu po lewej stronie? %>
<footer class="bg-dark text-center text-white">

    <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
        © 2022 Copyright:
        <a class="text-white">Aleksandra Wierzbicka</a>
        <button onclick="location.href='MainPage.jsp'" type="button" class="btn btn-danger">Powrót do strony głównej</button>
    </div>
    <!-- Copyright -->
</footer>

<script>
    window.addEventListener('load', (event) => {
        $('#dataTable').DataTable({
            searching: false,
            responsive: true
        });
    });
</script>
</body>
</html>