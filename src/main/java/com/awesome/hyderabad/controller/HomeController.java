package com.awesome.hyderabad.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.awesome.hyderabad.model.ResponseData;
import com.awesome.hyderabad.model.User;
import com.awesome.hyderabad.service.impl.UserServiceImpl;

/**
 *  This is the Home controller which renders starting
 *         pages of application
 *
 */

@RestController
public class HomeController {

	@Autowired
	private UserServiceImpl userServiceImpl;
	private static final Logger LOG = Logger.getLogger(HomeController.class);

	@GetMapping("/")
	public ModelAndView registerView() {

		return new ModelAndView("register");

	}

	@GetMapping("/home")
	public ModelAndView homeView() {

		return new ModelAndView("home");

	}

	/**
	 * This method can handle User add request
	 * 
	 * @param User
	 *            object
	 * @return ResponseData object
	 */

	@PostMapping(path="/addUser", consumes=MediaType.APPLICATION_JSON_VALUE, produces=MediaType.APPLICATION_JSON_VALUE)
	public ResponseData addUser(@RequestBody User user) {
		LOG.info("adding User in HomeController started");

		ResponseData responseData = userServiceImpl.addUser(user);

		LOG.info("adding User in HomeController ended");
		return responseData;

	}

}
