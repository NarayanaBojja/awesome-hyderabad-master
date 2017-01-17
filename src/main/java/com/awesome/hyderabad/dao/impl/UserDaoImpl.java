package com.awesome.hyderabad.dao.impl;

import java.util.Optional;

import org.apache.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.awesome.hyderabad.dao.UserDao;
import com.awesome.hyderabad.model.UserEntity;

@Repository
public class UserDaoImpl implements UserDao {
	@Autowired
	private SessionFactory sessionManager;
	private static final Logger LOG = Logger.getLogger(UserDaoImpl.class);

	/**
	 * This method saves or updates User data object into Database
	 * 
	 * @param UserEntity
	 *            object
	 * @return void
	 */
	@Override
	@Transactional
	public void addUser(UserEntity user) {

		LOG.info("adding UserEntity in UserDaoImpl started");
		try {

			Session session = sessionManager.getCurrentSession();

			session.save(user);

			LOG.info("adding UserEntity in UserDaoImpl ended");
		} catch (RuntimeException e) {
			LOG.error("Failed in adding UserEntity in UserDaoImpl", e);

		}

	}

	/**
	 * This method checks whether user information available in Database or not
	 * 
	 * 
	 * @param email
	 * @return Optional<UserEntity>
	 */
	@SuppressWarnings({ "unchecked" })
	@Override
	@Transactional
	public boolean userExists(String email) {
		Optional<UserEntity> user = null;
		boolean exists = false;

		LOG.info("checking UserEntity  by email in database start");
		try {
			String queryString = "from UserEntity where email=:email";

			Session session = sessionManager.getCurrentSession();

			user = session.createQuery(queryString)
					.setParameter("email", email).uniqueResultOptional();
			if (user.isPresent()) {
				exists = true;
			}

			LOG.info("checking UserEntity  by email in database end");
		} catch (RuntimeException re) {
			LOG.error("Failed in checking UserEntity  by email in database ",
					re);

		}
		return exists;

	}

	@SuppressWarnings("deprecation")
	@Override
	@Transactional
	public UserEntity loginUser(UserEntity userEntity) {
		LOG.info("checking UserEntity login  in database start");
		UserEntity user = null;
		try {
			String hql = "from UserEntity   where email =:email and password =:password";
			user = (UserEntity) sessionManager.getCurrentSession()
					.createQuery(hql)
					.setParameter("email", userEntity.getEmail())
					.setParameter("password", userEntity.getPassword())
					.uniqueResult();

			LOG.info("checking UserEntity login  in database end");
		} catch (RuntimeException e) {
			LOG.error("Failed in checking UserEntity login  in database", e);
		}
		return user;
	}

}
