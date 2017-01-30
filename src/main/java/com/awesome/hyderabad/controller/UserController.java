package com.awesome.hyderabad.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

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

	@GetMapping("logout")
	public ModelAndView logOut(HttpSession session, HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView view = new ModelAndView("home");
		try {
			if (ssn.removeUserSession(session, request, response)) {
				view.addObject("messageStatus", Constants.MESSAGE_SUCCESS);
				view.addObject("message", Constants.LOGOUT_SUCCESS);
				view.addObject("loginUserSesson", "logout");
			} else {
				view.addObject("messageStatus", Constants.MESSAGE_SUCCESS);
				view.addObject("message", Constants.LOGOUT_FAIL);
			}

		} catch (RuntimeException e) {
			LOG.error("faild in logout", e);
		}

		return view;

	}

	@GetMapping("userProfile.html")
	public ModelAndView userProfile(HttpServletRequest request) {
		ModelAndView view = new ModelAndView("user-profile");
		try {
			UserEntity user = ssn.checkUserSession(request);
			if (user != null) {
				user = userServiceImpl.getUserByEmail(user.getEmail());
				view.addObject("user", user);

			} else {
				view.setViewName("redirect:/home");
				view.addObject("messageStatus", Constants.MESSAGE_ERROR);
				view.addObject("message", Constants.SESSION_EXPIRED);
			}
		} catch (RuntimeException e) {
			LOG.error("failed in getting user profile", e);
		}

		return view;

	}

	@PostMapping("updateUser.html")
	public String updateUser(HttpSession session, HttpServletRequest request,
			HttpServletResponse response, @RequestBody String userInfo) {
		String result = Constants.COMMON_ERROR;
		try {

			UserEntity user = ssn.checkUserSession(request);
			if (user != null) {
				userInfo = userInfo.replace("\"", "");
				String[] userDetail = userInfo.split(Constants.DELEMETER, -1);
				user.setFirstName(userDetail[0]);
				user.setLastName(userDetail[1]);
				user.setEmail(userDetail[2]);
				user.setPassword(userDetail[3]);

				if (userServiceImpl.updateUser(user)) {
					ssn.addUserSession(session, request, response, user);
					result = Constants.USER_PERSIONAL_INFO_UPDATE_SUCCESS;
				} else
					result = Constants.USER_PERSIONAL_INFO_UPDATE_ERROR;
			}

		} catch (RuntimeException e) {
			LOG.error("Failed in updating user in User controller", e);
		}

		return result;

	}

}
