package com.integration.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.integration.help.PageBean;
import com.integration.service.UserService;
import com.integration.service.UserServiceImpl;
import com.opensymphony.xwork2.ActionSupport;


public class UserAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private UserService userService = new UserServiceImpl();  
    private int page;
    private int PageSize;
    public PageBean UserList;
    
	public PageBean getUserList() {
		return UserList;
	}
	public void setUserList(PageBean userList) {
		UserList = userList;
	}
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getPageSize() {
		return PageSize;
	}
	public void setPageSize(int pageSize) {
		PageSize = pageSize;
	}
	@Override
	public String execute() throws Exception {
		HttpServletRequest requestsize =ServletActionContext.getRequest();
    	String sizeString=requestsize.getParameter("PageSize");
    	int size=0;
    	if(sizeString!=null){
    		size = Integer.parseInt(sizeString);
    		PageSize=size;	    		
    	}  
    	if(PageSize==0){
    		PageSize=1;
    	}
        PageBean UserBean = userService.getPageBean(PageSize, page);
        HttpServletRequest request = ServletActionContext.getRequest();	        
        request.setAttribute("UserBean", UserBean);	       
        return SUCCESS;
	}
	public String testJson() {
		UserList = userService.getPageBean(PageSize, page);
		return SUCCESS;
	}
    
}
