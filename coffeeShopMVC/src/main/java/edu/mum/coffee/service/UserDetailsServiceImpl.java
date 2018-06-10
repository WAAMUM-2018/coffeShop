/**
 * 
 */
package edu.mum.coffee.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.mum.coffee.domain.Role;
import edu.mum.coffee.domain.User;
import edu.mum.coffee.repository.UserRepository;

/**
 * @author jeewa
 *
 */
@Service
public class UserDetailsServiceImpl implements UserDetailsService {

	@Autowired
	UserRepository userCredentialRepository;

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.springframework.security.core.userdetails.UserDetailsService#
	 * loadUserByUsername(java.lang.String)
	 */
	@Override
	@Transactional(readOnly = true)
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		User userCredentials = userCredentialRepository.findByUsername(username);
		List<GrantedAuthority> grantedAuthorities = new ArrayList<GrantedAuthority>();
		for (Role authority : userCredentials.getRoles()) {
			System.out.println("roles:"+authority.getName());
			grantedAuthorities.add(new SimpleGrantedAuthority(authority.getName()));
		}
		return new org.springframework.security.core.userdetails.User(userCredentials.getUsername(),
				userCredentials.getPassword(), grantedAuthorities);
	}

}
