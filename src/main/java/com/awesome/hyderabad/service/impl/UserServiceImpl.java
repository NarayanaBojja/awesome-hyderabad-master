package com.awesome.hyderabad.service.impl;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.awesome.hyderabad.dao.impl.UserDaoImpl;
import com.awesome.hyderabad.model.ResponseData;
import com.awesome.hyderabad.model.User;
import com.awesome.hyderabad.model.UserEntity;
import com.awesome.hyderabad.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	
	@Autowired
	private UserDaoImpl userDaoImpl;
	private static final Logger LOG = Logger
			.getLogger(UserServiceImpl.class);
	
	/**
	 * This method saves  User data object into Database
	 * 
	 * @param User object
	 *           
	 * @return ResponseData
	 */
	@Override
	public ResponseData addUser(User user) {
		LOG.info("adding User in UserServiceImpl started");
		ResponseData responseData = new ResponseData();
		UserEntity userEntity = new UserEntity();
		try{
			userEntity.setFirstName(user.getFirstName());
			userEntity.setLastName(user.getLastName());
			userEntity.setEmail(user.getEmail());
			userEntity.setPassword(user.getPassword());

			if (userDaoImpl.userExists(user.getEmail()) != true) {

				userDaoImpl.addUser(userEntity);

				responseData.setStatus("SUCCESS");
				responseData
						.setMessage("You have Registered Successfully");

			} else {
				responseData.setStatus("FAILURE");
				responseData
						.setMessage("User with this Email already existed");

			}
			
			
			
		}catch (Exception error) {
			responseData.setStatus("FAILURE");
			responseData.setMessage("Error in Registering User");

			LOG.error("Failed in adding User in UserDaoImpl",
					error);
		}
		
		return responseData;	
	}

}
