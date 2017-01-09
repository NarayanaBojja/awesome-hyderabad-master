package com.awesome.hyderabad.common;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Component;

@Component
public class Mail {
	private Logger LOG = Logger.getLogger(Mail.class);

	@Autowired
	private MailSender mailSender;

	public boolean sendMail(String from, String to, String subject, String msg) {
		boolean result = false;

		try {
			// creating message
			SimpleMailMessage message = new SimpleMailMessage();
			message.setFrom(from);
			message.setTo(to);
			message.setSubject(subject);
			message.setText(msg);
			// sending message
			mailSender.send(message);
			result = true;
		} catch (MailException ex) {
			LOG.error("Failed in sending Email to customer in Mail ", ex);
			throw ex;
		} finally {

		}

		return result;
	}

}
