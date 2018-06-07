/**
 * 
 */
package edu.mum.coffee.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import edu.mum.coffee.domain.Person;
import edu.mum.coffee.service.PersonService;

/**
 * @author jeewa
 *
 */
@RestController
public class PersonController {

	@Autowired
	PersonService personService;
	
	@RequestMapping(value = "/person/create", method = RequestMethod.POST)
	public Person createPerson(@RequestBody Person person) {
		personService.savePerson(person);
		return person;
	}
	
	@RequestMapping(value = "/person/edit", method = RequestMethod.PUT)
	public Person editPerson(@RequestBody Person person) {
		personService.savePerson(person);
		return person;
	}
	
	@GetMapping("person/list/{id}")
	public Person findById(@PathVariable("id") Long id) {
		return personService.findById(id);
	}
}
