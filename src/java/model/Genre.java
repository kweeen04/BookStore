/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author ADMIN
 */
public class Genre {
    private int genre_id;
    private String genre_name;
    private ArrayList<Book> book = new ArrayList<>();

    public Genre() {
    }

    public Genre(int genre_id, String genre_name) {
        this.genre_id = genre_id;
        this.genre_name = genre_name;
    }

    public Genre(String genre_name) {
        this.genre_name = genre_name;
    }

    public Genre(int genre_id) {
        this.genre_id = genre_id;
    }
    
    

    public int getGenre_id() {
        return genre_id;
    }

    public void setGenre_id(int genre_id) {
        this.genre_id = genre_id;
    }

    public String getGenre_name() {
        return genre_name;
    }

    public void setGenre_name(String genre_name) {
        this.genre_name = genre_name;
    }

    public ArrayList<Book> getBook() {
        return book;
    }

    public void setBook(ArrayList<Book> book) {
        this.book = book;
    }
    
}
