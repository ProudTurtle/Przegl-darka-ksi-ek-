package pjatk;

import javax.naming.Context;
import javax.naming.InitialContext;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Service {


    private static final String URL = "jdbc:sqlserver://localhost\\SQLEXPRESS01:1433;database=master;encrypt=true;trustServerCertificate=true";
    Connection connection;

    public Service() throws SQLException {
        try {

            DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver());
            connection = DriverManager.getConnection(URL, "guest", "test123");
        } catch (Exception exception) {
            exception.printStackTrace();
        }
    }

    public List<Book> getBooksFromDb() {
        String query = "Select * FROM Books";
        ArrayList<Book> books = new ArrayList<>();

        try {
            ResultSet resultSet = connection.createStatement().executeQuery(query);
            while (resultSet.next())
                books.add(new Book(
                        resultSet.getString("Title"),
                        resultSet.getString("Genre"),
                        resultSet.getString("Author"),
                        resultSet.getDouble("Price"),
                        resultSet.getDate("ReleaseDate")

                ));
        } catch (Exception exception) {
            exception.printStackTrace();
        }
        return books;
    }

    public List<Book> getBooks(String title, String genre, String author, String cenaod, String cenado) {
        ArrayList<Book> books = new ArrayList<>();

        if (cenaod.isEmpty()) {
            cenaod = "0";
        }
        if (cenado.isEmpty()) {
            cenado = "9999999";
        }

        try {
            String query = "SELECT * FROM Books WHERE Title LIKE ? AND Genre LIKE ? AND Author LIKE ? AND Price >= ? AND PRICE <= ? ";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1,"%" + title + "%");
            statement.setString(2,"%" + genre + "%");
            statement.setString(3,"%" + author + "%");
            statement.setString(4, cenaod);
            statement.setString(5, cenado);

            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next())
                books.add(new Book(
                        resultSet.getString("Title"),
                        resultSet.getString("Genre"),
                        resultSet.getString("Author"),
                        resultSet.getDouble("Price"),
                        resultSet.getDate("ReleaseDate")

                ));
        } catch (Exception exception) {
            exception.printStackTrace();
        }
        return books;
    }

    public ArrayList<String> getGenres()
    {
        ArrayList<String> genres = new ArrayList<>();
        genres.add("Fantasy");
        genres.add("Post-apocalyptic");
        genres.add("Childrens");
        genres.add("Literary Fiction");

        return genres;
    }

    public ArrayList<String> getAuthors()
    {
        ArrayList<String> authors = new ArrayList<>();
        authors.add("J. R. R. Tolkien");
        authors.add("J. K. Rowling");
        authors.add("Dmitry Glukhovsky");
        authors.add("E. B. White");
        authors.add("Ernest Hemingway");

        return authors;
    }

}
