/**
 * 
 */
package edu.mum.coffee.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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
	
	@RequestMapping(value = "/product/create", method = RequestMethod.GET)
	public String getCreateProduct(Model model) {
		Product product = new Product();
		model.addAttribute("txt_submit_btn", "Create");
		model.addAttribute("product", product);
		return "creaOrEdittOrder";
	}
	
	@RequestMapping(value = "/product/edit/{id}", method = RequestMethod.GET)
	public String getEditProduct(@PathVariable("id") int id, Model model) {
		Product product = productService.getProduct(id);
		model.addAttribute("txt_submit_btn", "Update");
		model.addAttribute("product", product);
		return "creaOrEdittOrder";
	}
	
	@RequestMapping(value = "/product/createOrEdit", method = RequestMethod.POST)
	public String createProduct(@RequestBody Product product, Model model) {
		productService.save(product);
		return "redirect:/product/edit/"+ product.getId();
	}
	
	/*@RequestMapping(value = "/product/edit", method = RequestMethod.PUT)
	public Product editProduct(@RequestBody Product product) {
		productService.save(product);
		return product;
	}*/
	
	@GetMapping("product/list")
	public String listAllProduct(Model model) {
		List<Product> products =  productService.getAllProduct();
		model.addAttribute("products", products);
		return "products";
	}
	
	@DeleteMapping("product/remove/{id}")
	public String reomoveProduct(@PathVariable("id") int id) {
		Product product = productService.getProduct(id);
		productService.delete(product);
		return "redirect:/product/list";
	}
}
