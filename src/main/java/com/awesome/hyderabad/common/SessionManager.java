package com.awesome.hyderabad.common;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;

import com.awesome.hyderabad.model.UserEntity;

@Component
public class SessionManager {

	public boolean addUserSession(HttpSession session,
			HttpServletRequest request, HttpServletResponse response,
			UserEntity userEntity) {
		removeUserSession(session, request, response);
		String userId = "" + userEntity.getUserId();
		Cookie chUserId = new Cookie("userId", userId);
		Cookie chUserName = new Cookie("userName", userEntity.getFirstName());
		Cookie chUserEmail = new Cookie("userEmail", userEntity.getEmail());
		Cookie chUserPassword = new Cookie("userPassword",
				userEntity.getPassword());

		chUserId.setMaxAge(3600);
		chUserName.setMaxAge(3600);
		chUserEmail.setMaxAge(3600);
		chUserPassword.setMaxAge(3600);

		response.addCookie(chUserId);
		response.addCookie(chUserName);
		response.addCookie(chUserEmail);
		response.addCookie(chUserPassword);

		return true;
	}

	public boolean removeUserSession(HttpSession session,
			HttpServletRequest request, HttpServletResponse response) {

		for (Cookie ck : request.getCookies()) {

			if ("userId".equalsIgnoreCase(ck.getName())) {
				ck.setValue("");
				ck.setMaxAge(0);
				response.addCookie(ck);
			}
			if ("userName".equalsIgnoreCase(ck.getName())) {
				ck.setValue("");
				ck.setMaxAge(0);
				response.addCookie(ck);
			}
			if ("userEmail".equalsIgnoreCase(ck.getName())) {
				ck.setValue("");
				ck.setMaxAge(0);
				response.addCookie(ck);
			}
			if ("userPassword".equalsIgnoreCase(ck.getName())) {
				ck.setValue("");
				ck.setMaxAge(0);
				response.addCookie(ck);
			}

		}

		return true;

	}

	public UserEntity checkUserSession(HttpServletRequest request) {
		Cookie[] cookies = request.getCookies();
		UserEntity user = null;
		String userId = "", userName = "", userEmail = "", userPassword = "";
		for (Cookie ck : cookies) {
			if (ck.getName().equalsIgnoreCase("userId"))
				userId = ck.getValue();
			if (ck.getName().equalsIgnoreCase("userName"))
				userName = ck.getValue();
			if (ck.getName().equalsIgnoreCase("userEmail"))
				userEmail = ck.getValue();
			if (ck.getName().equalsIgnoreCase("userPassword"))
				userPassword = ck.getValue();
		}

		if (!userId.isEmpty()) {
			user = new UserEntity(Integer.parseInt(userId), userName,
					userEmail, userPassword);
		}

		return user;

	}

}
