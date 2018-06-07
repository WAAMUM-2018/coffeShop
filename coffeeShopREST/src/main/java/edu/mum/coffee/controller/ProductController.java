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
import org.springframework.web.bind.annotation.RestController;

import edu.mum.coffee.domain.Product;
import edu.mum.coffee.service.ProductService;

/**
 * @author jeewa
 *
 */
@RestController("/products")
public class ProductController {
	
	@Autowired
	ProductService productService;
	
	@PostMapping("/create")
	public Product createProduct(Product product) {
		productService.save(product);
		return product;
	}
	
	@PostMapping("/edit")
	public Product editProduct(Product product) {
		productService.save(product);
		return product;
	}
	
	@GetMapping("/list")
	public List<Product> listAllProduct() {
		return productService.getAllProduct();
	}
	
	@DeleteMapping("/remove/{id}")
	public void reomoveProduct(@PathVariable("id") int id) {
		Product product = productService.getProduct(id);
		productService.delete(product);
	}
}
