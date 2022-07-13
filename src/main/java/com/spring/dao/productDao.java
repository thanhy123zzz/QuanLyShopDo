package com.spring.dao;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCallback;
import org.springframework.web.multipart.MultipartFile;

import com.spring.beans.Product;
import com.spring.beans.Type;

public class productDao {
	JdbcTemplate template;    
    
	public void setTemplate(JdbcTemplate template) {    
	    this.template = template;    
	}    
	public int updateHasImage(Product p, MultipartFile image) throws IOException{      
	    byte[] photoBytes = image.getBytes();

		String sql = "update product set name =?,size=?,price=?,status=?,amount=?,typeID=?,image=? where id=?";

		return template.update(sql, new Object[] { p.getName(), p.getSize(),p.getPrice(),p.getStatus(),p.getAmount(),p.getIDType(), photoBytes,p.getId() });
	} 
	public int updateHasNotImage(Product p){      

		String sql = "update product set name =?,size=?,price=?,status=?,amount=?,typeID=? where id=?";

		return template.update(sql, new Object[] { p.getName(), p.getSize(),p.getPrice(),p.getStatus(),p.getAmount(),p.getIDType(),p.getId() });
	}  
	public int delete(int id){    
	    String sql="delete from product where id="+id+"";    
	    return template.update(sql);    
	}    
	public  List<Product> getProductById(int id){    
		return template.query("select * from product where id = "+id+"" ,new MapperProduct());    
	}    
	public List<Product> getProducts(){    
	    return template.query("select * from product",new MapperProduct());    
	}  
	public List<Product> searchProduct(String keyword){    
	    return template.query("select * from product where CONCAT(name,size,price,status) LIKE '%"+keyword+"%'",new MapperProduct());    
	} 
	public List<Product> getProductsbyPage(int pageid,int total){    
	    return template.query("select * from product limit "+(pageid-1)+","+total,new MapperProduct());    
	}  
	public List<Product> getProductByTypeID(int typeid){    
	    return template.query("select * from product where typeID ="+typeid ,new MapperProduct());    
	}
	public List<Product> getProductsbyPageAndTpye(int pageid,int total,int typeid){    
	    return template.query("select * from product where typeID ="+typeid+" limit "+(pageid-1)+","+total,new MapperProduct());    
	}
	public List<Type> getTypes(){    
	    return template.query("select * from type",new MapperType());    
	}  
	public List<Type> getTypesbyID(int id){    
	    return template.query("select * from type where id = "+ id,new MapperType());    
	}  
	
	public int insertProduct(Product p, MultipartFile image) throws IOException {

		byte[] photoBytes = image.getBytes();

		String sql = "INSERT INTO product(name,size,price,status,amount,typeID,image) VALUES (?,?,?,?,?,?,?)";

		return template.update(sql, new Object[] { p.getName(), p.getSize(),p.getPrice(),p.getStatus(),p.getAmount(),p.getIDType(), photoBytes });
	}
	public int insertProductHasNotImage(Product p) {
		String sql = "INSERT INTO product(name,size,price,status,amount,typeID) VALUES (?,?,?,?,?,?)";

		return template.update(sql, new Object[] { p.getName(), p.getSize(),p.getPrice(),p.getStatus(),p.getAmount(),p.getIDType() });
	}
	
	public Blob getPhotobyID(int id){    
		String query = "select image from product where id =?";
	    return template.queryForObject(query, new Object[] { id }, Blob.class);
	} 
	
	public Boolean saveEmployeeByPreparedStatement(){  
	    String query="insert into product(image) values(?)";  
	    return template.execute(query,new PreparedStatementCallback<Boolean>(){  
	    @Override  
	    public Boolean doInPreparedStatement(PreparedStatement ps)  
	            throws SQLException, DataAccessException {  
	    	InputStream in;
			try {
				in = new FileInputStream("D:\\downloads\\a.jpg");
				ps.setBlob(1, in);
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			}
	        return ps.execute();  
	    }  
	    });  
	}  
}
