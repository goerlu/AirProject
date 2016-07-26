package com.integration.service;
import java.util.List;

import com.integration.dao.UserDAO;
import com.integration.entity.User;
import com.integration.help.PageBean;
public class UserServiceImpl implements UserService {
	private UserDAO userDAO;
	public void setUserDAO(UserDAO userDAO){
		this.userDAO=userDAO;
	}
	public void saveUser(User user) {
		if(userDAO.findById(user.getId())==null)
			userDAO.save(user);
	}
	public User getUser(String name) {
		return userDAO.getUser(name);
	}
	public void deleteUser(int id) {
		if(userDAO.findById(id)!=null)
			userDAO.delete(id);
		
	}
	public void updateUser(User user) {
		if(userDAO.findById(user.getId())!=null)
			userDAO.update(user);
	}
	public User findUserById(int id) {
		return userDAO.findById(id);
	}
	public List<User> findAll() {
		return userDAO.findAll();
	}

	public PageBean getPageBean(int pageSize, int page) {
		PageBean pageBean = new PageBean();
        
        String hql = "from User";
        
        int allRows = userDAO.getAllRowCount(hql);
        
        int totalPage = pageBean.getTotalPages(pageSize, allRows);
        
        int currentPage = pageBean.getCurPage(page);
        
        int offset = pageBean.getCurrentPageOffset(pageSize, currentPage);
        
        List<User> list = userDAO.queryByPage(hql, offset, pageSize);
        
        pageBean.setList(list);
        pageBean.setAllRows(allRows);
        pageBean.setCurrentPage(currentPage);
        pageBean.setTotalPage(totalPage);
        
        return pageBean;
	}

	
}
