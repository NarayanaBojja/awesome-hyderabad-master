package com.awesome.hyderabad.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.awesome.hyderabad.common.Constants;
import com.awesome.hyderabad.common.Mail;
import com.awesome.hyderabad.model.UserEntity;
import com.awesome.hyderabad.service.impl.UserServiceImpl;

/**
 * This is the Home controller which renders starting pages of application
 *
 */

@RestController
public class HomeController {

	private static final Logger LOG = Logger.getLogger(HomeController.class);
	@Autowired
	private UserServiceImpl userServiceImpl;
	@Autowired
	Mail mail;

	@GetMapping(path = { "/", "login" })
	public ModelAndView loginView() {

		return new ModelAndView("login");

	}

	@GetMapping("/register")
	public ModelAndView registerView() {

		return new ModelAndView("register");

	}

	@GetMapping("/home")
	public ModelAndView homeView() {

		return new ModelAndView("home");

	}

	@GetMapping("about")
	public ModelAndView aboutUs() {
		return new ModelAndView("about");
	}

	@GetMapping("forgot-password")
	public ModelAndView forgotPassword() {
		return new ModelAndView("forgot-password");
	}

	@SuppressWarnings("unused")
	@PostMapping("checkUser")
	public String checkUser(@RequestBody String email,
			HttpServletResponse response) {
		String message = "<i class=\"fa fa-warning\"></i>";

		try {
			UserEntity user = userServiceImpl.getUserByEmail(email);

			if (user != null) {

				message = "<i class=\"fa fa-check\"></i>";
				Cookie chUserEmail = new Cookie("userEmail", email);
				chUserEmail.setMaxAge(3600);
				response.addCookie(chUserEmail);

			}
		} catch (Exception e) {
			LOG.error("failed in getting user", e);
		}

		return message;

	}

	@PostMapping("setPassword")
	public String setPassword(@RequestBody String password,
			HttpServletRequest request) {
		String message = "<i class=\"fa fa-warning\"></i>";

		try {
			String userEmail = null;
			for (Cookie ck : request.getCookies()) {

				if (ck.getName().equalsIgnoreCase("userEmail"))
					userEmail = ck.getValue();

			}

			UserEntity user = userServiceImpl.getUserByEmail(userEmail);

			if (user != null) {

				user.setPassword(password);
				if (userServiceImpl.updateUser(user)) {
					message = "<i class=\"fa fa-check\"></i>";
				}

			}
		} catch (Exception e) {
			LOG.error("failed in setting new password", e);
		}

		return message;

	}

	@GetMapping("contact")
	public ModelAndView contactUs() {
		return new ModelAndView("contact-us");
	}

	@GetMapping("top-places.html")
	public ModelAndView topPlaces() {
		return new ModelAndView("top-places");
	}

	/**
	 * This method sends mail to the customer
	 * 
	 * @param mailDetails
	 * @return String
	 */
	@PostMapping("send-feedbackmail")
	public String sendFeedBackMail(@RequestBody String mailDetails) {
		LOG.info("Sending Email to customer started");
		String result = Constants.COMMON_ERROR;
		try {

			mailDetails = mailDetails.replace("\"", "");
			String[] mailInfo = mailDetails.split(Constants.DELEMETER);

			String name = mailInfo[0];
			String email = mailInfo[1];
			String subject = mailInfo[2];
			String body = mailInfo[3];
			String userMailSubject = "RE: " + subject;
			String userMailbody = "Hi " + name + ", \n\n"
					+ Constants.MK_FEEDBACK_MAIL_BODY;
			// Send to customer
			mail.sendMail(Constants.MK_EMAIL, email, userMailSubject,
					userMailbody);
			// Send to our support team
			mail.sendMail(email, Constants.MK_EMAIL, subject, body.toString());

			result = Constants.FEEDBACK_MAIL_SUCCESS;
			LOG.info("Sending Email to customer ended");

		} catch (Exception e) {
			result = Constants.FEEDBACK_MAIL_ERROR;
			LOG.error("Failed in sending Email to customer in HomeController ",
					e);
		}

		return result;

	}

}
