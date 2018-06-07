/**
 * 
 */
package edu.mum.coffeShopRestTemplate.service;

import org.springframework.http.ResponseEntity;
import org.springframework.http.client.support.BasicAuthorizationInterceptor;
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
}
