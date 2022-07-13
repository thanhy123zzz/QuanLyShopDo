package com.spring.controllers;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.sql.Blob;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.spring.beans.Product;
import com.spring.dao.productDao;

@Controller
public class EmpController {
	@Autowired
	productDao dao;// will inject dao from XML file
	
	@RequestMapping("/")
	public String index() {
//    	if(dao.saveEmployeeByPreparedStatement())
//    	{
//    		System.out.println("đc");
//    	}
//    	else
//    	{
//    		System.out.println("k đc");
//    	}
		return "redirect:/admin/viewemp1";
	}

	/*
	 * It displays a form to input data, here "command" is a reserved request
	 * attribute which is used to display object data into form
	 */
	/* It provides list of employees in model object */
	@RequestMapping("/admin/viewemp{pageid}")
	public String viewemp(@PathVariable int pageid, Model m) {
		int total = 6;
		m.addAttribute("page", pageid);
		if (pageid == 1) {
		} else {
			pageid = (pageid - 1) * total + 1;
		}
		List<Product> list1 = dao.getProductsbyPage(pageid, total);
		List<Product> list = dao.getProducts();
		m.addAttribute("list1", list1);
		double a = (double) list.size() / 6;
		m.addAttribute("soluongPage", (int) Math.ceil(a));
		m.addAttribute("product", new Product());
		m.addAttribute("types", dao.getTypes());
		return "viewemp";
	}
	@RequestMapping("/admin/viewemp/{typeid}")
	public String viewempType(@PathVariable("typeid") int typeid, Model m) {
		m.addAttribute("product", new Product());
		m.addAttribute("soluongPage", 1);
		m.addAttribute("types", dao.getTypes());
		m.addAttribute("typeid", typeid);
		m.addAttribute("list1", dao.getProductByTypeID(typeid));
		return "viewemp";
	}
	@RequestMapping(value = { "/admin/viewemp" })
	public String viewSearch(@RequestParam("keyword") String keyword, Model m) {
		m.addAttribute("product", new Product());
		m.addAttribute("soluongPage", 1);
		m.addAttribute("types", dao.getTypes());
		m.addAttribute("list1", dao.searchProduct(keyword));
		return "viewemp";
	}
	/*
	 * It displays object data into form for the given id. The @PathVariable puts
	 * URL data into variable.
	 */
	@RequestMapping("/login")
	public String display(Model m) {
		return "login";
	}

	@RequestMapping("/logout")
	public String thoat(Model m) {
		return "logout";
	}

	@RequestMapping("/admin/them-san-pham")
	public String ThemSanPham(Model m) {
		m.addAttribute("product", new Product());
		m.addAttribute("types", dao.getTypes());
		return "productAdd";
	}

	@RequestMapping(value = { "/admin/them-san-pham" },method = RequestMethod.POST)
	public String btnThemSanPham(@ModelAttribute("product") Product product,@RequestParam("image") MultipartFile image,
			@RequestParam("idType") int type
			, Model m) {
		try {
			product.setIDType(type);
			if(image.getSize()!=0)
			dao.insertProduct(product, image);
			else
			dao.insertProductHasNotImage(product);
			m.addAttribute("msg", "Records succesfully inserted into database.");
			m.addAttribute("types", dao.getTypes());
			return "productAdd";

		} catch (Exception e) {
			m.addAttribute( "msg", "Error: " + e.getMessage());
			m.addAttribute("types", dao.getTypes());
			return "productAdd";
		}
	}
	@RequestMapping("/admin/sua-san-pham/{id}")
	public String SuaSanPham(@PathVariable("id") int id,Model m) {
		m.addAttribute("product", dao.getProductById(id).get(0));
		m.addAttribute("idType", dao.getProductById(id).get(0).getIDType());
		m.addAttribute("types", dao.getTypes());
		return "productEdit";
	}
	@RequestMapping(value = { "/admin/sua-san-pham/{id}" },method = RequestMethod.POST)
	public String btnSuaSanPham(@ModelAttribute("product") Product product,@RequestParam("image") MultipartFile image,
			@RequestParam("idType") int type, Model m) {
		try {
			product.setIDType(type);
			if(image.getSize()!=0) {
				dao.updateHasImage(product, image);
			}else {
				dao.updateHasNotImage(product);
			}
			m.addAttribute("msg", "Records succesfully inserted into database.");
			m.addAttribute("idType", product.getIDType());
			m.addAttribute("product", product);
			m.addAttribute("types", dao.getTypes());
			return "productEdit";
		} catch (Exception e) {
			m.addAttribute( "msg", "Error: " + e.getMessage());
			m.addAttribute("idType", product.getIDType());
			m.addAttribute("types", dao.getTypes());
			return "productEdit";
		}
		
	}
	@RequestMapping("/admin/viewemp/{typeid}/xoa/{id}")
	public String XoaSanPham(@PathVariable("id") int id,@PathVariable("typeid") int typeid, Model m) {
		dao.delete(id);
		return "redirect:/admin/viewemp/"+typeid;
	}
	@RequestMapping("/admin/viewemp{page}/xoa/{id}")
	public String XoaSanPham2(@PathVariable("id") int id, @PathVariable("page") int page , Model m) {
		dao.delete(id);
		return "redirect:/admin/viewemp"+page;
	}
	@RequestMapping(value = "/InsertImage")
	public String Anh() {
		return "test";
	}
	@RequestMapping(value = "/admin/{id}")
	public void getStudentPhoto(HttpServletResponse response, @PathVariable("id") int id) throws Exception {
		response.setContentType("image/jpeg");

		Blob ph = dao.getPhotobyID(id);

		byte[] bytes = ph.getBytes(1, (int) ph.length());
		InputStream inputStream = new ByteArrayInputStream(bytes);
		IOUtils.copy(inputStream, response.getOutputStream());
	}
//    @RequestMapping(value ={"/upload"},method = RequestMethod.POST)	
//    public String upaload(@ModelAttribute("product") @RequestPart Product product){
//    	return "productAdd";
//    }
}