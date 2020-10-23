package edu.osu.cse5234.bussiness;

import java.util.List;
import java.util.UUID;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;

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

    /**
     * Default constructor. 
     */
    public OrderProcessingServiceBean() {
        // TODO Auto-generated constructor stub
    }
    
    public String processOrder(Order order) {
    	InventoryService inventoryService = ServiceLocator.getInventoryService();
    	List<LineItem> lineItems = order.getLineItems();
    	if(inventoryService.validateQuantity(lineItems)) {
    		if(!inventoryService.updateInventory(lineItems)) {
    			return "Error";
    		}
    	} else {
    		return "Error";
    	}
    	
    	return UUID.randomUUID().toString();
    }
    
    public boolean validateItemAvailability(Order order) {
    	InventoryService inventoryService = ServiceLocator.getInventoryService();
    	return inventoryService.validateQuantity(order.getItems());
    }
}
