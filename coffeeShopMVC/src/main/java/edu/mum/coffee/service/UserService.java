/**
 * 
 */
package edu.mum.coffee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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
	UserRepository userRepository;

	public User savePerson(User userCredentials) {
		return userRepository.save(userCredentials);
	}

	public List<User> findAll() {
		return userRepository.findAll();
	}
	
	public User findById(String id) {
		return userRepository.findOne(id);
	}
}
