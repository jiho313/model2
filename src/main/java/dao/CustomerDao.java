package dao;

import util.DaoHelper;
import vo.Customer;

public class CustomerDao {

	public Customer getCustomerById(String id) {
		return DaoHelper.selectOne("getCustomerById", rs -> {
			Customer customer = new Customer();
			customer.setId(rs.getString("cust_id"));
			customer.setPassword(rs.getString("cust_password"));
			customer.setName(rs.getString("cust_name"));
			customer.setTel(rs.getString("cust_tel"));
			customer.setEmail(rs.getString("cust_email"));
			customer.setDisabled(rs.getString("cust_disabled"));
			customer.setPoint(rs.getInt("cust_point"));
			customer.setUpdateDate(rs.getDate("cust_update_date"));
			customer.setCreateDate(rs.getDate("cust_create_date"));
			return customer;
		}, id);
	}

	public Customer getCustomerByEmail(String email) {
		return DaoHelper.selectOne("getCustomerByEmail", rs -> {
			Customer customer = new Customer();
			customer.setId(rs.getString("cust_id"));
			customer.setPassword(rs.getString("cust_password"));
			customer.setName(rs.getString("cust_name"));
			customer.setTel(rs.getString("cust_tel"));
			customer.setEmail(rs.getString("cust_email"));
			customer.setDisabled(rs.getString("cust_disabled"));
			customer.setPoint(rs.getInt("cust_point"));
			customer.setUpdateDate(rs.getDate("cust_update_date"));
			customer.setCreateDate(rs.getDate("cust_create_date"));
			
			return customer;
		}, email);
	}
	
	public void insertCustomer(Customer customer) {
		DaoHelper.update("insertCustomer", customer.getId(), customer.getPassword(), customer.getName(), customer.getTel(), customer.getEmail());
	}
}
