package com.awesome.hyderabad.service;

import com.awesome.hyderabad.model.ResponseData;
import com.awesome.hyderabad.model.User;

public interface UserService {

	
	/**
	 * This method saves  User data object into Database
	 * 
	 * @param User  object
	 *           
	 * @return ResponseData
	 */
	public ResponseData addUser(User user);
	
	
	
}
