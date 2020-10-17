package edu.osu.cse5234.business;

import edu.osu.cse5234.business.view.Inventory;
import edu.osu.cse5234.business.view.InventoryService;
import edu.osu.cse5234.business.view.Item;

import java.util.ArrayList;
import java.util.List;

import javax.ejb.Stateless;

/**
 * Session Bean implementation class InventoryServiceBean
 */
@Stateless
public class InventoryServiceBean implements InventoryService {

    /**
     * Default constructor. 
     */
    public InventoryServiceBean() {
        // TODO Auto-generated constructor stub
    }
    @Override
    public Inventory getAvailableInventory() {
		Inventory inventory = new Inventory();
		List<Item> items = new ArrayList<>();
		String[] names = {"Machine Learning Engineering", "Introduction to Algorithms", "Python for Data Analysis", "C Programming Language", "Computer Networking: A Top-Down Approach"};
		String[] prices = {"39.95", "68.47", "39.95", "63.65", "164.65"};
		for(int i=0; i<5; i++) {
			Item item = new Item();
			item.setName(names[i]);
			item.setPrice(prices[i]);
			items.add(item);			
		}
		inventory.setItems(items);
		return inventory;
	}
	@Override
	public boolean validateQuantity(List<Item> items) {
		// TODO Auto-generated method stub
		return true;
	}
	@Override
	public boolean updateInventory(List<Item> items) {
		// TODO Auto-generated method stub
		return true;
	}

}
