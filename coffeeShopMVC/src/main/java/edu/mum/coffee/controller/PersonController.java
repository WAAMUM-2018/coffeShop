/**
 * 
 */
package edu.mum.coffee.controller;

import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import edu.mum.coffee.domain.Person;
import edu.mum.coffee.domain.Role;
import edu.mum.coffee.service.PersonService;
import edu.mum.coffee.service.RoleService;

/**
 * @author jeewa
 *
 */
@Controller
@RequestMapping("/person")
public class PersonController {

	@Autowired
	PersonService personService;

	@Autowired
	RoleService roleService;

	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String createPerson(Model model) {
		Person person = new Person();
		model.addAttribute("person", person);
		model.addAttribute("edit", false);
		return "person";
	}

	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String createPerson(@ModelAttribute("person") Person person) {
		String redirectUrl = "redirect:/";
		/* Set the role as USER - role 'USER' should have id = 1 in role table*/
		if (person.getUser() != null) {
			Role role = roleService.findById(1);
			person.getUser().addRole(role);
			System.out.println("jee");
		}
		person = personService.savePerson(person);
		
		//based on the user role direct to different uris
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Collection<? extends GrantedAuthority> authorities = auth.getAuthorities();
		boolean authorized = authorities.contains(new SimpleGrantedAuthority("ADMIN"));
		if(authorized) {
			redirectUrl = "redirect:/person/list";
		}
		else {
			redirectUrl = "redirect:/person/edit?personId=" + person.getId();
		}
		
		return redirectUrl;
	}

	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String getEditPerson(@RequestParam("personId") Long personId, Model model) {
		Person person;
		
		if (personId > 0) {
			person = personService.findById(personId);
		} else {
			/* To fetch person details by user id */
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			person = personService.findByUserId(auth.getName());
		}
		model.addAttribute("person", person);
		model.addAttribute("edit", true);
		return "person";
	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String listPersons(Model model) {
		List<Person> persons = personService.findAll();
		model.addAttribute("persons", persons);
		return "persons";
	}
}
