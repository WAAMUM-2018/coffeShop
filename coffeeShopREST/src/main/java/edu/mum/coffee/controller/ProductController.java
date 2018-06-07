/**
 * 
 */
package edu.mum.coffee.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import edu.mum.coffee.domain.Product;
import edu.mum.coffee.service.ProductService;

/**
 * @author jeewa
 *
 */
@RestController()
public class ProductController {
	
	@Autowired
	ProductService productService;
	
	@RequestMapping(value = "/product/create", method = RequestMethod.POST)
	public Product createProduct(@RequestBody Product product) {
		productService.save(product);
		return product;
	}
	
	@RequestMapping(value = "/product/edit", method = RequestMethod.PUT)
	public Product editProduct(@RequestBody Product product) {
		productService.save(product);
		return product;
	}
	
	@GetMapping("product/list")
	public List<Product> listAllProduct() {
		return productService.getAllProduct();
	}
	
	@DeleteMapping("product/remove/{id}")
	public void reomoveProduct(@PathVariable("id") int id) {
		Product product = productService.getProduct(id);
		productService.delete(product);
	}
}
