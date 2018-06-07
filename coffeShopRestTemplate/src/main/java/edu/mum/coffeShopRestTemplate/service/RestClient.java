/**
 * 
 */
package edu.mum.coffeShopRestTemplate.service;

import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;

import edu.mum.coffeShopRestTemplate.model.Product;

/**
 * @author jeewa
 *
 */
public class RestClient {
	
	RestTemplate restTemplate;
	String baseURL = "http://localhost:8080/";
	
	public RestClient() {
		restTemplate = new RestTemplate();
	}
	
	/**
	 * Save Products
	 */
	public void saveProduct(Product product) {
		System.out.println("Begin /POST request!");
		/*restTemplate.getInterceptors().
			add(new BasicAuthorizationInterceptor("super", "pw"));
*/		
		ResponseEntity<String> postResponse = restTemplate.
				postForEntity(baseURL+"product/create", product, String.class);
		System.out.println("Response for Post Request: " + postResponse.getBody());
	}
	
	/**
	 * get entity
	 */
	public void getProducts(){
		System.out.println("Begin /GET request!");
		List<LinkedHashMap> productList = restTemplate.getForObject(baseURL+"/product/list", List.class);
		for(LinkedHashMap map : productList) {
			System.out.println("ID:"+map.get("id")+	
							   " Product Name: " + map.get("productName") +
							   " Description: " + map.get("description") +
							   " Price: $" + map.get("price") + 
							   " Product Type: " + map.get("productType"));
		}
	}
	
	/**
	 * put entity
	 */
	public void updateProduct(Product product){
		System.out.println("Begin /PUT request!");

		restTemplate.put(baseURL+"product/edit", product);
	}
	
	/**
	 * delete entity
	 */
	public void deleteProduct(int id){
		System.out.println("Begin /DELETE request!");
		restTemplate.delete(baseURL+"product/remove/" + id);
	}
}
