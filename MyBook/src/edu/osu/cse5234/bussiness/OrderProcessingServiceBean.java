package edu.osu.cse5234.bussiness;

import java.util.List;
import java.util.UUID;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.*;

import edu.osu.cse5234.business.view.Inventory;
import edu.osu.cse5234.business.view.InventoryService;
import edu.osu.cse5234.business.view.Item;
import edu.osu.cse5234.model.LineItem;
import edu.osu.cse5234.model.Order;
import edu.osu.cse5234.util.ServiceLocator;

/**
 * Session Bean implementation class OrderProcessingServiceBean
 */
@Stateless
@LocalBean
public class OrderProcessingServiceBean {
	
	@PersistenceContext
	EntityManager entityManager;
	
    /**
     * Default constructor. 
     */
    public OrderProcessingServiceBean() {
        // TODO Auto-generated constructor stub
    }
    
    public String processOrder(Order order) {
    	//InventoryService inventoryService = ServiceLocator.getInventoryService();
    	
    	if(!validateItemAvailability(order)) {
    		return "Error";
    	}
    	
    	entityManager.persist(order);
    	entityManager.flush();
    	
    	return UUID.randomUUID().toString();
    }
    
    public boolean validateItemAvailability(Order order) {
    	InventoryService inventoryService = ServiceLocator.getInventoryService();
    	Inventory inventory = inventoryService.getAvailableInventory();
    	
    	List<LineItem> lineItems = order.getLineItems(); 
    	List<Item> items = inventory.getItems();
    	
    	for(LineItem lineItem : lineItems) {
    		int itemNumber = lineItem.getItemNumber();
    		for(Item item : items) {
    			int itemNumberInventory = item.getItemNumber();
    			if(itemNumber == itemNumberInventory) {
    				if(item.getQuantity() < lineItem.getQuantity()) {
    					return false;
    				}
    			}
    		}
    	}
    	return true;
    }
}
