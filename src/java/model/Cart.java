/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class Cart {

    List<Item> items;

    public Cart() {
        items = new ArrayList<>();
    }

    public Cart(List<Item> items) {
        this.items = items;
    }

    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }

    // số lượng 1 sản phẩm trong giỏ
    public int getQuantityByID(String id) {
        return getItemByID(id).getQuantity();
    }

    private Item getItemByID(String id) {
        for (Item i : items) {
            if (i.getBook().getBook_id().equals(id)) {
                return i;
            }
        }
        return null;
    }
    
    private Item CheckItem(String id) {
        for (Item i : items) {
            if (i.getBook().getBook_id().equals(id)) {
                return i;
            }
        }
        return null;
    }

    // add 1 sản phẩm vào giỏ, nếu có rồi thì tăng số lượng
    public void addItem(Item t) {
        if (getItemByID(t.getBook().getBook_id()) != null && CheckItem(t.getBook().getBook_id()) != null) {
            Item m = getItemByID(t.getBook().getBook_id());
            m.setQuantity(m.getQuantity() + t.getQuantity());
        } else {
            items.add(t);
        }
    }

    // loại sản phẩm khỏi giỏ hàng
    public void removeItem(String id) {
        if (getItemByID(id) != null) {
            items.remove(getItemByID(id));
        }
    }

    //Tổng tiền của giỏ hàng --> add vào Order
    public double getTotalMoney() {
        double t = 0;
        for (Item i : items) {
            t += (i.getQuantity() * i.getBook().getBook_price());
        }
        return t;
    }
}
