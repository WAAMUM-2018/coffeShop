package edu.mum.coffeShopRestTemplate;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.web.EmbeddedServletContainerAutoConfiguration;
import org.springframework.boot.autoconfigure.web.servlet.WebMvcAutoConfiguration;

import edu.mum.coffeShopRestTemplate.model.Product;
import edu.mum.coffeShopRestTemplate.model.ProductType;
import edu.mum.coffeShopRestTemplate.service.RestClient;

@SpringBootApplication
@EnableAutoConfiguration(exclude = {EmbeddedServletContainerAutoConfiguration.class, WebMvcAutoConfiguration.class})

public class CoffeShopRestTemplateApplication {

	public static void main(String[] args) {
		//SpringApplication.run(CoffeShopRestTemplateApplication.class, args);
		
		RestClient restClient  = new RestClient();
		Product breakfast = new Product("c-1","Mexican Coffee", 12.5, ProductType.BREAKFAST);
		Product lunch = new Product("c-2","Sri Lankan Coffee", 15.5, ProductType.LUNCH);
		Product dinner = new Product("c-3","Americam Coffee", 10.5, ProductType.DINNER);
		restClient.saveProduct(breakfast);
		restClient.saveProduct(lunch);
		restClient.saveProduct(dinner);
	}
}
