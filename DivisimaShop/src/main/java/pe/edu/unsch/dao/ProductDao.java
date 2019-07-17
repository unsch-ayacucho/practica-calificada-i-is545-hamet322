package pe.edu.unsch.dao;

import java.util.List;

import pe.edu.unsch.entities.Product;

public interface ProductDao {
	
	public Product find(Integer  id);
	public List<Product> featured(int n);
	public List<Product> latest(int n);

}
