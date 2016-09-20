package com.demoproject.model;
import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;


@Entity
public class UserPost implements Serializable{

    private static final long serialVersionUID = -3532377236419382983L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int postid;
    private String posttitle;
    private String postmessage;
    
    private String username;
    private Date postdate;
    
	public int getPostid() {
		return postid;
	}
	public void setPostid(int postid) {
		this.postid = postid;
	}
	public String getPosttitle() {
		return posttitle;
	}
	public void setPosttitle(String posttitle) {
		this.posttitle = posttitle;
	}
	public String getPostmessage() {
		return postmessage;
	}
	public void setPostmessage(String postmessage) {
		this.postmessage = postmessage;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Date getPostdate() {
		return postdate;
	}
	public void setPostdate(Date postdate) {
		this.postdate = postdate;
	}
    
    
}
