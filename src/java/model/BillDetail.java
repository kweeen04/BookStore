/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ADMIN
 */
public class BillDetail {
    private int detail_id;
    private int bill_id;
    private Book book;
    private int quantity;
    private float price;

    public BillDetail() {
    }

    public BillDetail(int detail_id, int bill_id, Book book, int quantity) {
        this.detail_id = detail_id;
        this.bill_id = bill_id;
        this.book = book;
        this.quantity = quantity;
    }

    public BillDetail(int detail_id, Book book, int quantity, float price) {
        this.detail_id = detail_id;
        this.book = book;
        this.quantity = quantity;
        this.price = price;
    }

    public int getDetail_id() {
        return detail_id;
    }

    public void setDetail_id(int detail_id) {
        this.detail_id = detail_id;
    }

    public int getBill_id() {
        return bill_id;
    }

    public void setBill_id(int bill_id) {
        this.bill_id = bill_id;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "BillDetail{" + "detail_id=" + detail_id + ", book=" + book + ", quantity=" + quantity + ", price=" + price + '}';
    }

    
    
}
