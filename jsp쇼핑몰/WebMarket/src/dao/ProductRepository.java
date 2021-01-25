package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.Product;
import dto.User;

public class ProductRepository {
	
	private ArrayList<Product> listOfProducts = new ArrayList<>();
	private static ProductRepository instance = new ProductRepository();

	public ProductRepository() {
		Product phone = new Product("P1234", "iPhone 12 Pro", 1300000);
		phone.setDescription("6.5-inch, 2033x1150 Renina display");
		phone.setCategory("Smart Phone");
		phone.setManufacturer("Apple");
		phone.setUnitsInStock(1000);
		phone.setCondition("New");
		phone.setFilename("P1234.png");
		
		Product notebook = new Product("P1235", "LG Gram 15'", 1700000);
		notebook.setDescription("15-inch, 1920x1080 144hz display");
		notebook.setCategory("Notebook");
		notebook.setManufacturer("LG");
		notebook.setUnitsInStock(1000);
		notebook.setCondition("Refurbished");
		notebook.setFilename("P1235.png");
		
		Product tablet = new Product("P1236", "Galaxy Tab S", 500000);
		tablet.setDescription("10.1-inch, 1420x880 AMOLED");
		tablet.setCategory("Tablet");
		tablet.setManufacturer("Samsung");
		tablet.setUnitsInStock(1000);
		tablet.setCondition("Old");
		tablet.setFilename("P1236.png");
		
		listOfProducts.add(phone);
		listOfProducts.add(notebook);
		listOfProducts.add(tablet);	
	}
	
//	public ProductRepository() {
//		try {
//			String dbURL = "jdbc:mysql://localhost:3306/jsptest";
//			String dbID = "root";
//			String dbPassword = "1234";
//			Class.forName("com.mysql.jdbc.Driver");
//			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
//	
//	public int addProduct(Product product) {
//		String SQL = "insert into user values (?,?,?,?,?)";
//		try {
//			pstmt = conn.prepareStatement(SQL);
//			pstmt.setString(1, user.getUserID());
//			pstmt.setString(2, user.getUserPassword());
//			pstmt.setString(3, user.getUserName());
//			pstmt.setString(4, user.getUserGender());
//			pstmt.setString(5, user.getUserEmail());
//			pstmt.setString(5, user.getUserEmail());
//			return pstmt.executeUpdate();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return -1;
//	}
	
	
	
	public ArrayList<Product> getAllProducts() {
		return listOfProducts;
	}
	
	public Product getProductById(String productId) {
		Product productById = null;
		
		for(int i=0; i<listOfProducts.size(); i++) {
			Product product = listOfProducts.get(i);
			if(product != null && product.getProductId() != null && product.getProductId().equals(productId)) {
				productById = product;
				break;
			}
		}
		return productById;
	}
	
	public static ProductRepository getInstance() {
		return instance;
	}
	
	public void addProduct(Product product) {
		listOfProducts.add(product);
	}
}
