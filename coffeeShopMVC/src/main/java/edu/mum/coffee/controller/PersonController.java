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
import edu.mum.coffee.service.PersonService;

/**
 * @author jeewa
 *
 */
@Controller
@RequestMapping("/person")
public class PersonController {

	@Autowired
	PersonService personService;

	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String createPerson(Model model) {
		Person person = new Person();
		model.addAttribute("person", person);
		return "createPerson";
	}

	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String createPerson(@ModelAttribute("person") Person person) {
		personService.savePerson(person);
		return "redirect:/person/list";
	}

	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String editPerson(@RequestParam("personId") Long personId, Model model) {
		Person person = personService.findById(personId);
		model.addAttribute("person", person);
		return "createPerson";
	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String listPersons(Model model) {
		List<Person> persons = personService.findAll();
		model.addAttribute("persons", persons);
		return "persons";
	}
}
