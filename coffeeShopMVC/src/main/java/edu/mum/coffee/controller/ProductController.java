/**
 * 
 */
package edu.mum.coffee.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.mum.coffee.domain.Product;
import edu.mum.coffee.domain.ProductType;
import edu.mum.coffee.service.ProductService;

/**
 * @author jeewa
 *
 */
@Controller()
@RequestMapping("/product")
public class ProductController {

	@Autowired
	ProductService productService;

	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String getCreateProduct(Model model) {
		Product product = new Product();
		model.addAttribute("product", product);
		
		return "createOrEditProduct";
	}

	@RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
	public String getEditProduct(@PathVariable("id") int id, Model model) {
		Product product = productService.getProduct(id);
		model.addAttribute("product", product);
		
		return "createOrEditProduct";
	}

	@RequestMapping(value = {"/createOrEdit","/edit/createOrEdit"}, method = RequestMethod.POST)
	public String createProduct(@ModelAttribute("product") Product product, Model model) {
		System.out.println(product.getId());
		productService.save(product);
		return "redirect:/product/list";
	}

	@ModelAttribute
	public void addAttributes(Model model) {
		List <ProductType> productTypes = new ArrayList<ProductType> (Arrays.asList(ProductType.values()));
        model.addAttribute("productTypes", productTypes);
	}

	@GetMapping(value = {"/list"})
	public String listAllProduct(Model model) {
		List<Product> products = productService.getAllProduct();
		model.addAttribute("products", products);
		return "products";
	}

	@RequestMapping(value = "/remove/{id}" , method = RequestMethod.GET)
	public String reomoveProduct(@PathVariable("id") int id) {
		Product product = productService.getProduct(id);
		productService.delete(product);
		return "redirect:/product/list";
	}
}
