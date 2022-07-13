package com.spring.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.spring.beans.Type;

public class MapperType implements RowMapper<Type>{

	@Override
	public Type mapRow(ResultSet rs, int rowNum) throws SQLException {
		Type type = new Type();
		type.setId(rs.getInt("id"));
		type.setType(rs.getString("type"));
		return type;
	}

}
