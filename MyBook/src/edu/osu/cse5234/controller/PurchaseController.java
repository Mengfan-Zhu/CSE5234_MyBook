package edu.osu.cse5234.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.osu.cse5234.business.view.Inventory;
import edu.osu.cse5234.business.view.InventoryService;
import edu.osu.cse5234.bussiness.OrderProcessingServiceBean;
import edu.osu.cse5234.model.*;
import edu.osu.cse5234.util.ServiceLocator;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/purchase")
public class PurchaseController {
	@RequestMapping(method = RequestMethod.GET)
	public String viewOrderEntryForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// ... instantiate and set order object with items to display
		InventoryService inventoryService = ServiceLocator.getInventoryService();
		Inventory inventory = inventoryService.getAvailableInventory();
		if(request.getSession().getAttribute("resubmit") == null) {
			request.getSession().setAttribute("resubmit", false);
		}
		Order order = new Order();
		order.setItems(inventory.getItems());
		request.setAttribute("order", order);
		return "OrderEntryForm";
	}

	@RequestMapping(path = "/submitItems", method = RequestMethod.POST)
	public String submitItems(@ModelAttribute("order") Order order, HttpServletRequest request) {
		request.getSession().setAttribute("order", order);
		OrderProcessingServiceBean orderProcessingServiceBean = ServiceLocator.getOrderProcessingService();
		boolean isValid = orderProcessingServiceBean.validateItemAvailability(order);
		if(isValid) {
			return "redirect:/purchase/paymentEntry";
		}else {
			request.getSession().setAttribute("resubmit", true);
			return "redirect:/purchase";
		}
		
	}
	
	@RequestMapping(path = "/paymentEntry", method = RequestMethod.GET)
	public String viewPaymentEntryForm(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("payment", new PaymentInfo());	
		return "PaymentEntryForm";
	}
	
	@RequestMapping(path = "/submitPayment", method = RequestMethod.POST)
	public String submitPayment(@ModelAttribute("payment") PaymentInfo paymentInfo, HttpServletRequest request) {
		request.getSession().setAttribute("payment", paymentInfo);
		return "redirect:/purchase/shippingEntry";
	}
	
	@RequestMapping(path = "/shippingEntry", method = RequestMethod.GET)
	public String viewShippingEntryForm(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("shipping", new ShippingInfo());	
		return "ShippingEntryForm";
	}
	
	@RequestMapping(path = "/submitShipping", method = RequestMethod.POST)
	public String submitShipping(@ModelAttribute("shipping") ShippingInfo shippingInfo, HttpServletRequest request) {
		request.getSession().setAttribute("shipping", shippingInfo);
		return "redirect:/purchase/viewOrder";
	}
	
	@RequestMapping(path = "/viewOrder", method = RequestMethod.GET)
	public String viewOrder(HttpServletRequest request, HttpServletResponse response) {	
		return "ViewOrder";
	}
	
	@RequestMapping(path = "/confirmOrder", method = RequestMethod.POST)
	public String confirmOrder(PaymentInfo paymentInfo, HttpServletRequest request) {
		OrderProcessingServiceBean orderProcessingServiceBean = ServiceLocator.getOrderProcessingService();
		Order order = (Order) request.getSession().getAttribute("order");
		
		String confirmNum = orderProcessingServiceBean.processOrder(order);
		request.getSession().setAttribute("confirmNum", confirmNum);
		
		return "redirect:/purchase/viewConfirmation";
	}
	
	@RequestMapping(path = "/viewConfirmation", method = RequestMethod.GET)
	public String viewConfirmation(HttpServletRequest request, HttpServletResponse response) {
		
		return "Confirmation";
	}
}
