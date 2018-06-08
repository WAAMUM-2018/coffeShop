/**
 * 
 */
package edu.mum.coffee.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import edu.mum.coffee.domain.Order;
import edu.mum.coffee.service.OrderService;

/**
 * @author jeewa
 *
 */
@RestController
public class OrderController {
	
	@Autowired
	OrderService orderService;
	
	@RequestMapping(value = "/order/create", method = RequestMethod.POST)
	public Order createOrder(@RequestBody Order order) {
		orderService.save(order);
		return order;
	}
	
	@GetMapping("order/list")
	public List<Order> listAllOrder() {
		return orderService.findAll();
	}
}
