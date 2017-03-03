package com.awesome.hyderabad.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.connect.Connection;
import org.springframework.social.connect.UserProfile;
import org.springframework.social.facebook.api.Facebook;
import org.springframework.social.facebook.api.User;
import org.springframework.social.facebook.connect.FacebookConnectionFactory;
import org.springframework.social.oauth2.AccessGrant;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.awesome.hyderabad.common.Constants;
import com.awesome.hyderabad.common.SessionManager;
import com.awesome.hyderabad.model.ResponseData;
import com.awesome.hyderabad.model.UserEntity;
import com.awesome.hyderabad.service.impl.UserServiceImpl;

@RestController
public class HelloController {
	@Autowired
	FacebookConnectionFactory facebookConnectionFactory;
	@Autowired
	private UserServiceImpl userServiceImpl;
	@Autowired
	SessionManager ssn;

	@GetMapping("/facebook")
	public ModelAndView connectFacebook(HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {
		ModelAndView view = new ModelAndView("home");

		try {

			OAuth2Operations oauthOperations = facebookConnectionFactory
					.getOAuthOperations();
			OAuth2Parameters params = new OAuth2Parameters();
			params.setRedirectUri("http://localhost:8080/awesome-hyderabad-master/facebookLogin");
			String authorizeUrl = oauthOperations.buildAuthorizeUrl(params);
			response.sendRedirect(authorizeUrl);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return view;
		// http://localhost:8080/awesome-hyderabad-master/facebookLogin

	}

	@GetMapping("/facebookLogin")
	public void getUserDetails(
			@RequestParam(name = "code") String authorizationCode,
			HttpServletRequest request, HttpServletResponse response,
			HttpSession session) {
	//	ModelAndView view = new ModelAndView("login");
		OAuth2Operations oauthOperations = facebookConnectionFactory
				.getOAuthOperations();
		AccessGrant accessGrant = oauthOperations.exchangeForAccess(
				authorizationCode,
				"http://localhost:8080/awesome-hyderabad-master/facebookLogin",
				null);
		Connection<Facebook> connection = facebookConnectionFactory
				.createConnection(accessGrant);
		Facebook facebook = connection.getApi();
		String[] fields = { "id", "email", "first_name", "last_name" };
		User userProfile = facebook.fetchObject("me", User.class, fields);

		String firstName = userProfile.getFirstName();
		String lastName = userProfile.getLastName();
		String email = userProfile.getEmail();
		String passWord = firstName;
		com.awesome.hyderabad.model.User userEntity = new com.awesome.hyderabad.model.User(
				firstName, lastName, email, passWord);

		ResponseData responseData = userServiceImpl.addUser(userEntity);

		UserEntity UserEntity2 = new UserEntity(firstName, lastName, email,
				passWord);

		//if (userEntity != null) {
			if (ssn.addUserSession(session, request, response, UserEntity2));
			//	view = new ModelAndView("home");
		/*	else
				view = new ModelAndView("login");
		}*/

	//	return view;

	}

}
