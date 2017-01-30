package com.awesome.hyderabad.dao;

import com.awesome.hyderabad.model.UserEntity;

/**
 * 
 * It is DAO(Data Access Object) interface which defines all User related
 * operations(create,read,update,delete)
 *
 */
public interface UserDao {
	/**
	 * This method saves User data object into Database
	 * 
	 * @param UserEntity
	 *            object
	 * @return void
	 */
	public void addUser(UserEntity user);

	/**
	 * This method checks whether user information available in Database or not
	 * 
	 * 
	 * @param email
	 * @return boolean
	 */
	public boolean userExists(String email);

	public UserEntity loginUser(UserEntity userEntity);

	public UserEntity getUserByEmail(String email);
	
	public void updateUser(UserEntity userEntity);

}
