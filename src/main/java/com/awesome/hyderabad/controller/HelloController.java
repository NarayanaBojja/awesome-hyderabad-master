package com.awesome.hyderabad.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.connect.UserProfile;
import org.springframework.social.facebook.connect.FacebookConnectionFactory;
import org.springframework.social.oauth2.AccessGrant;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class HelloController {
	@Autowired
	FacebookConnectionFactory facebookConnectionFactory;

	@GetMapping("/facebook")
	public ModelAndView connectFacebook() {
		ModelAndView view = new ModelAndView("home");

		try {
			UserProfile UserProfile = facebookConnectionFactory
					.createConnection(
							new AccessGrant("EAAZAZAsZA37i0EBACnZAKlHwXa2zNuF1ZBXzZAvdrGYZB3wEe1UDtZAEUTIPtZAscIVeYmIb5dlXuVZCZBGQJuL8QXnUBOzBTi9ZAWKMYmeIz9BKssfY2GQB5QvNdUZBO7WyC1jseixFY9iTTrSc5JOCKNPhZCHjKZCHSmyYdWiyIIgu2tAzjzACfVS2MUlCHsC4Ykcaa0ZD"))
					.fetchUserProfile();

			String firstName = UserProfile.getFirstName();
			System.out.println(firstName);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return view;

	}

}
