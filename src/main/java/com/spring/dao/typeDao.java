package com.spring.dao;

import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;

import com.spring.beans.Type;

public class typeDao {
JdbcTemplate template;    
    
	public void setTemplate(JdbcTemplate template) {    
	    this.template = template;    
	}    
	public List<Type> getTypes(){    
	    return template.query("select * from type",new MapperType());    
	}  
}
