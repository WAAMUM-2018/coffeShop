/**
 * 
 */
package edu.mum.coffee.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.mum.coffee.domain.Role;
import edu.mum.coffee.repository.RoleRepository;

/**
 * @author jeewa
 *
 */
@Service
@Transactional
public class RoleService {
	
	@Autowired
	RoleRepository roleRepository;
	
	public Role findById(long id) {
		return roleRepository.findOne(id);
	}
}
