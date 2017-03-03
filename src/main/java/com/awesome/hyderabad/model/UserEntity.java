package com.awesome.hyderabad.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "users")
public class UserEntity {
	@Id
    @Column(name="user_id")
    @GeneratedValue
	private int userId;
	
	
	@Column(name="firstname")
	private String firstName;
	

	@Column(name="lastname")
	private String lastName;
	
	
	@Column(name="email")
	private String email;
	
	
	@Column(name="password")
	private String password;
	
	public UserEntity() {
		
	}

	public UserEntity( String firstName, String lastName,
			String email, String password) {
		super();
		this.lastName = lastName;
		this.firstName = firstName;
		
		this.email = email;
		this.password = password;
	}
	
	

	public UserEntity(int userId, String firstName, 
			String email, String password) {
		super();
		this.userId = userId;
		this.firstName = firstName;
		
		this.email = email;
		this.password = password;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	
}
