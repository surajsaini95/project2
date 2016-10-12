package com.demoproject.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.demoproject.model.Customer;
import com.demoproject.model.UserPost;
import com.demoproject.service.CustomerService;
import com.demoproject.service.UserPostService;


@Controller
public class HomeController {

	 @Autowired
	    private UserPostService userPostService;

	 @RequestMapping("/")
	    public String home() {
	        return "home";
	    }
		
	 @RequestMapping("/chat")
	    public String showchat() {
	        return "chat";
	    }
	 
	 @RequestMapping("/newchatroom")
	    public String shownewchatroom() {
	        return "newchatroom";
	    }
		
	@RequestMapping("/admin")
    public String adminpage() {
        return "admin";
    }
	
	@RequestMapping("/home")
    public String homepage() {
        return "home";
    }
	
	@RequestMapping("/recentpost")
    public String showrecentpost(Model model) {
        
		 List<UserPost> userPost = userPostService.getUserPostList();
	        model.addAttribute("userPost", userPost);

		return "recentpost";
    }
	
	@RequestMapping("/editpost")
    public String showeditpost(Model model) {
        
		 List<UserPost> userPost = userPostService.getUserPostList();
	        model.addAttribute("userPost", userPost);

		return "editpost";
    }
	
	@RequestMapping("/myposts")
    public String showmyposts(Model model) {
        
		 List<UserPost> userPost = userPostService.getUserPostList();
	        model.addAttribute("userPost", userPost);

		return "myposts";
    }
	
	@RequestMapping("/delete/{id}")
    public String deletePost(@PathVariable int id, Model model, HttpServletRequest request) {
        
        UserPost userPost = userPostService.getUserPostById(id);
        userPostService.deleteUserPost(userPost);

        return "redirect:/editpost";
    }
	
	@RequestMapping("/deletemy/{id}")
    public void deletemyPost(@PathVariable int id, Model model, HttpServletRequest request) {
		System.out.print("\n\n\n\n\n date \n\n\n");
    	
        UserPost userPost = userPostService.getUserPostById(id);
        userPostService.deleteUserPost(userPost);

       
    }
	
    @RequestMapping("/addpost")
    public String showaddpost(Model model) {
    	UserPost userPost=new UserPost();
    	
    	model.addAttribute("userPost",userPost); 	
        return "addpost";
    }
    
    @RequestMapping(value="/addnewpost", method=RequestMethod.POST)
    public String addnewpost(@Valid @ModelAttribute("userPost") UserPost userPost,BindingResult result,
    		                HttpServletRequest request)
    {
    	if(result.hasErrors()) {
            return "addpost";
        }
    	
    	java.util.Date d=new java.util.Date();
    	userPost.setPostdate(d);
    	System.out.print("\n\n\n\n\n date = "+userPost.getPostdate()+"\n\n\n");
    	userPostService.addUserPost(userPost);

    	return "redirect:/myposts";
    }
    
    
    @RequestMapping("/editmypost/{id}")
    public String editmypost(@PathVariable("id") int id, Model model) {
        UserPost userPost = userPostService.getUserPostById(id);

        model.addAttribute("userPost", userPost);

        return "editmypost";
    }  
    
    @RequestMapping(value="/editmy", method = RequestMethod.POST)
    public String editUserPost(@Valid @ModelAttribute("userPost") UserPost userPost, BindingResult result,
                                 HttpServletRequest request) {
        if(result.hasErrors()) {
            return "home";
        }
    	java.util.Date d=new java.util.Date();
    	userPost.setPostdate(d);
    
        System.out.println("\nedited values = "+userPost.getPostid());
        System.out.println("\nedited values = "+userPost.getPostmessage());
         userPostService.editUserPost(userPost);

        return "redirect:/myposts";
    }

    @RequestMapping("/registersuccess")
    public String registersuccesspage() {
        return "registersuccess";
    }
    
    @RequestMapping("/login")
    public String login(@RequestParam(value="error", required = false) String error, @RequestParam(value="logout",
            required = false) String logout, Model model) {
        if (error!=null) {
            model.addAttribute("error", "Invalid username and password");
        }

        if(logout!=null) {
            model.addAttribute("msg", "You have been logged out successfully.");
        }

        return "login";
    }
    
    @Autowired
    private CustomerService customerService;

    @RequestMapping("/register")
    public String registerCustomer(Model model) {

        Customer customer = new Customer();
       
        model.addAttribute("customer", customer);

        return "register";

    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String registerCustomerPost(@Valid @ModelAttribute("customer") Customer customer, BindingResult result,
                                       Model model) {

        if (result.hasErrors()) {
            return "register";
        }

        List<Customer> customerList=customerService.getAllCustomers();

        for (int i=0; i< customerList.size(); i++) {
            if(customer.getCustomerEmail().equals(customerList.get(i).getCustomerEmail())) {
                model.addAttribute("emailMsg", "Email already exists");

                return "register";
            }

            if(customer.getUsername().equals(customerList.get(i).getUsername())) {
                model.addAttribute("usernameMsg", "Username already exists");

                return "register";
            }
        }

        customer.setEnabled(true);
        customerService.addCustomer(customer);

        return "registersuccess";

    }


}
