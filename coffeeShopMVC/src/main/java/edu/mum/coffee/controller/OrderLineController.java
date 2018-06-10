/**
 * 
 */
package edu.mum.coffee.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import edu.mum.coffee.domain.Order;
import edu.mum.coffee.domain.Orderline;
import edu.mum.coffee.domain.Product;
import edu.mum.coffee.service.OrderService;
import edu.mum.coffee.service.ProductService;

/**
 * @author jeewa
 *
 */
@Controller()
@RequestMapping("/orderline")
public class OrderLineController {

	@Autowired
	OrderService orderService;
	@Autowired
	ProductService productService;

	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String getCreateOrderLine(@RequestParam("orderId") int orderId, Model model) {
		Orderline orderLine = new Orderline();
		if (orderId > 0) {
			Order order = orderService.findById(orderId);
			orderLine.setOrder(order);
		}
		model.addAttribute("orderline", orderLine);

		return "createOrder";
	}

	@RequestMapping(value = { "/createOrder" }, method = RequestMethod.POST)
	public String createOrder(@ModelAttribute("orderline") Orderline orderLine, Model model) {
		Order order = orderLine.getOrder();
		if (order == null) {
			order = new Order();
			order.setOrderDate(new Date());
		}
		order.addOrderLine(orderLine);
		orderService.save(order);
		return "redirect:/order/orderdetails?orderId="+order.getId();
	}

	@ModelAttribute
	public void populateProducts(Model model) {
		List<Product> products = productService.getAllProduct();
		model.addAttribute("products", products);
	}
}
