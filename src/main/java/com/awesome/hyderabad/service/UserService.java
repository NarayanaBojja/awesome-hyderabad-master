package com.awesome.hyderabad.service;

import com.awesome.hyderabad.model.ResponseData;
import com.awesome.hyderabad.model.User;
import com.awesome.hyderabad.model.UserEntity;

public interface UserService {

	/**
	 * This method saves User data object into Database
	 * 
	 * @param User
	 *            object
	 * 
	 * @return ResponseData
	 */
	public ResponseData addUser(User user);

	/**
	 * This method tests user details
	 * 
	 * @param UserEntity
	 *            object
	 * 
	 * @return UserEntity
	 */
	public UserEntity loginUser(UserEntity userEntity);

	public UserEntity getUserByEmail(String email);

	public boolean updateUser(UserEntity userEntity);

}
