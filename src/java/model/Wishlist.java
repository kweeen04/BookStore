package model;

import java.util.ArrayList;
import java.util.List;

public class Wishlist {

    List<Item> items;

    public Wishlist() {
        items = new ArrayList<>();
    }

    public Wishlist(List<Item> items) {
        this.items = items;
    }

    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }

    public int getQuantityByID(String id) {
        Item item = getItemByID(id);
        if (item != null) {
            return item.getQuantity();
        }
        return 0;
    }

    public boolean containsBook(String id) {
        return getItemByID(id) != null;
    }

    public void addItem(Item item) {
        // Check if the book is already in the wishlist
        if (containsBook(item.getBook().getBook_id())) {
            // Book already exists in the wishlist, display a message or handle accordingly
            System.out.println("Book is already in the wishlist.");
            return; // Exit the method without adding the book again
        }

        // Book doesn't exist in the wishlist, add it
        items.add(item);
    }

    // Remove an item from the wishlist
    public void removeItem(String id) {
        Item itemToRemove = getItemByID(id);
        if (itemToRemove != null) {
            items.remove(itemToRemove);
        }
    }

    // Get an item by its book ID
    private Item getItemByID(String id) {
        for (Item item : items) {
            if (item.getBook().getBook_id().equals(id)) {
                return item;
            }
        }
        return null;
    }
}
