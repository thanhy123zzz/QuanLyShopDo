package com.spring.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.spring.beans.Product;

public class MapperProduct implements RowMapper<Product>{

	@Override
	public Product mapRow(ResultSet rs, int rowNum) throws SQLException {
        Product product = new Product();
        product.setId(rs.getInt("id"));
        product.setName(rs.getString("name"));
        product.setSize(rs.getString("size"));
        product.setPrice(rs.getDouble("price"));
        product.setStatus(rs.getString("status"));
        product.setAmount(rs.getInt("amount"));
        product.setIDType(rs.getInt("typeID"));
        return product;
	}

}
