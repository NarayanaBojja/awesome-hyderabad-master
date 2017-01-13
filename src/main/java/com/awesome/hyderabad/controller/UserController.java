package com.awesome.hyderabad.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.awesome.hyderabad.common.Constants;
import com.awesome.hyderabad.common.SessionManager;
import com.awesome.hyderabad.model.ResponseData;
import com.awesome.hyderabad.model.User;
import com.awesome.hyderabad.model.UserEntity;
import com.awesome.hyderabad.service.impl.UserServiceImpl;

/**
 * This is the UserController which deals with user register, login requests
 *
 */

@RestController
public class UserController {
	private static final Logger LOG = Logger.getLogger(HomeController.class);
	@Autowired
	private UserServiceImpl userServiceImpl;
	@Autowired
	SessionManager ssn;
	/**
	 * This method can handle User add request
	 * 
	 * @param User
	 *            object
	 * @return ResponseData object
	 */

	@PostMapping(path = "/addUser", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseData addUser(@RequestBody User user) {
		LOG.info("adding User in HomeController started");
		System.out.println("Coming2");
		ResponseData responseData = userServiceImpl.addUser(user);

		LOG.info("adding User in HomeController ended");
		return responseData;

	}

	@PostMapping("login-user")
	public String loginUser(HttpSession session, HttpServletRequest request,
			HttpServletResponse response, @RequestBody String userInfo) {
		LOG.info("loginUser in UserController start");
		String result = Constants.COMMON_ERROR;

		try {
			UserEntity userEntity = new UserEntity();
			
			userInfo = userInfo.replace("\"", "");
			String[] userDetail = userInfo.split(Constants.DELEMETER, -1);
			userEntity.setEmail(userDetail[0]);
			userEntity.setPassword(userDetail[1]);

			userEntity = userServiceImpl.loginUser(userEntity);

			if (userEntity != null) {
				if (ssn.addUserSession(session, request, response, userEntity))
					result = Constants.LOGIN_SUCCESS;
				else
					result = Constants.LOGIN_FAIL_CK;
			} else
				result = Constants.LOGIN_FAIL;
			LOG.info("loginUser in UserController end");
		} catch (Exception e) {

			LOG.error("Failed in loginUser in UserController", e);

		}

		return result;

	}

}
