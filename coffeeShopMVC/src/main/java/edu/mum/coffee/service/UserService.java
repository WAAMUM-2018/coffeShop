/**
 * 
 */
package edu.mum.coffee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.authentication.UserCredentials;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.mum.coffee.domain.User;
import edu.mum.coffee.repository.UserRepository;

/**
 * @author jeewa
 *
 */
@Service
@Transactional
public class UserService {

	@Autowired
	UserRepository userRespository;

	public User savePerson(User userCredentials) {
		return userRespository.save(userCredentials);
	}

	public List<User> findAll() {
		return userRespository.findAll();
	}
}
