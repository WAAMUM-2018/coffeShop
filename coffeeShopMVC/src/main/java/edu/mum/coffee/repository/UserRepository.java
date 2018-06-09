/**
 * 
 */
package edu.mum.coffee.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import edu.mum.coffee.domain.User;

/**
 * @author jeewa
 *
 */
public interface UserRepository extends JpaRepository<User, String> {
	User findByUsername(String username);
	//UserCredentials getActiveUserCredentials(String username);
}
