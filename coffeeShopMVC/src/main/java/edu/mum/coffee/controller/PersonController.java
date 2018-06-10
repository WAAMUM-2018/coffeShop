/**
 * 
 */
package edu.mum.coffee.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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
		model.addAttribute("edit" , false);
		return "person";
	}

	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String createPerson(@ModelAttribute("person") Person person) {
		/*Set the role as USER*/
		if(person.getUser() != null) {
			Role role = roleService.findById(2);
			person.getUser().addRole(role);
		}
		
		personService.savePerson(person);
		return "redirect:/person/list";
	}

	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String editPerson(@RequestParam("personId") Long personId, Model model) {
		Person person = personService.findById(personId);
		model.addAttribute("person", person);
		model.addAttribute("edit" , true);
		return "person";
	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String listPersons(Model model) {
		List<Person> persons = personService.findAll();
		model.addAttribute("persons", persons);
		return "persons";
	}
}
