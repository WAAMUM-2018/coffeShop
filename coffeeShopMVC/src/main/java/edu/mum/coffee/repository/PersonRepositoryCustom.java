/**
 * 
 */
package edu.mum.coffee.repository;

import edu.mum.coffee.domain.Person;

/**
 * @author jeewa
 * This is a custom repository interface to fetch person by other fields
 */
public interface PersonRepositoryCustom {
	public Person findByUserId(String userId);
}
