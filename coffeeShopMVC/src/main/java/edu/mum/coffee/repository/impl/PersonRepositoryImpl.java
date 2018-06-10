/**
 * 
 */
package edu.mum.coffee.repository.impl;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import edu.mum.coffee.domain.Person;
import edu.mum.coffee.repository.PersonRepositoryCustom;

/**
 * @author jeewa
 *
 */
@Repository
@Transactional(readOnly = true)
public class PersonRepositoryImpl implements PersonRepositoryCustom{

    @PersistenceContext
    EntityManager entityManager;


	/* (non-Javadoc)
	 * @see edu.mum.coffee.repository.PersonRepositoryCustom#findByUserId(java.lang.String)
	 */
	public Person findByUserId(String userId) {
		// TODO Auto-generated method stub
        Query query = entityManager.createNativeQuery("SELECT p.* FROM person as p " +

                "WHERE p.user_id = ?", Person.class);

        query.setParameter(1, userId);

        return (Person) query.getResultList().get(0);
	}

}
