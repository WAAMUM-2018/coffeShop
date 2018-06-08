/**
 * 
 */
package edu.mum.coffee.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.mum.coffee.domain.Order;
import edu.mum.coffee.service.OrderService;

/**
 * @author jeewa
 *
 */
@Controller
public class OrderController {
	
	@Autowired
	OrderService orderService;
	
	@RequestMapping(value = "/order/create", method = RequestMethod.POST)
	public String createOrder(@RequestBody Order order, Model model) {
		orderService.save(order);
		model.addAttribute("order",order);
		return "redirect:/orderDetails";
	}
	
	@GetMapping("order/list")
	public String listAllOrder(Model model) {
		List<Order> orders = orderService.findAll();
		model.addAttribute("orders",orders);
		return "orders";
	}
}
