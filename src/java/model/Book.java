
package model;

import java.sql.Date;


public class Book {
    private Genre genre;
    private String book_id;
    private String book_name;
    private String book_author;
    private float book_price;
    private String book_description;
    private int book_quantity;
    private String img_URL;
    private Date public_date;

    public Book() {
    }


    public Book(Genre genre, String book_id, String book_name, String book_author, float book_price, String book_description, int book_quantity, String img_URL, Date public_date) {
        this.genre = genre;
        this.book_id = book_id;
        this.book_name = book_name;
        this.book_author = book_author;
        this.book_price = book_price;
        this.book_description = book_description;
        this.book_quantity = book_quantity;
        this.img_URL = img_URL;
        this.public_date = public_date;
    }

    public Book(String book_id, String book_name, String book_author, float book_price, String book_description, int book_quantity, String img_URL, Date public_date) {
        this.book_id = book_id;
        this.book_name = book_name;
        this.book_author = book_author;
        this.book_price = book_price;
        this.book_description = book_description;
        this.book_quantity = book_quantity;
        this.img_URL = img_URL;
        this.public_date = public_date;
    }

    public Book(String book_id, String book_name, String img_URL) {
        this.book_id = book_id;
        this.book_name = book_name;
        this.img_URL = img_URL;
    }

    public Book(String book_id, String book_name, String book_author, String img_URL) {
        this.book_id = book_id;
        this.book_name = book_name;
        this.book_author = book_author;
        this.img_URL = img_URL;
    }
    

    public String getBook_id() {
        return book_id;
    }

    public void setBook_id(String book_id) {
        this.book_id = book_id;
    }

    public Genre getGenre() {
        return genre;
    }

    public void setGenre(Genre genre) {
        this.genre = genre;
    }

    public String getBook_name() {
        return book_name;
    }

    public void setBook_name(String book_name) {
        this.book_name = book_name;
    }

    public String getBook_author() {
        return book_author;
    }

    public void setBook_author(String book_author) {
        this.book_author = book_author;
    }

    public float getBook_price() {
        return book_price;
    }

    public void setBook_price(float book_price) {
        this.book_price = book_price;
    }

    public String getBook_description() {
        return book_description;
    }

    public void setBook_description(String book_description) {
        this.book_description = book_description;
    }

    public int getBook_quantity() {
        return book_quantity;
    }

    public void setBook_quantity(int book_quantity) {
        this.book_quantity = book_quantity;
    }

    public String getImg_URL() {
        return img_URL;
    }

    public void setImg_URL(String img_URL) {
        this.img_URL = img_URL;
    }

    public Date getPublic_date() {
        return public_date;
    }

    public void setPublic_date(Date public_date) {
        this.public_date = public_date;
    }
    

    @Override
    public String toString() {
        return "Book{" + "genre=" + genre + ", book_id=" + book_id + ", book_name=" + book_name + ", book_author=" + book_author + ", book_price=" + book_price + ", book_description=" + book_description + ", book_quantity=" + book_quantity + ", img_URL=" + img_URL + ", public_date=" + public_date + '}';
    }
    
    
}
