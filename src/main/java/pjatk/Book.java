package pjatk;

import java.sql.Date;

public class Book {
    String title, genre, author;
    Double price;
    Date date;


    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Date getDate() {
        return date;
    }

    public Book(String title, String genre, String author, Double price, Date date){
        this.author =author;
        this.genre = genre;
        this.title = title;
        this.price = price;
        this.date = date;
    }

    public String toString(){
        return title + " " + genre + " " + author + " " + price + " " + date;
    }
}
