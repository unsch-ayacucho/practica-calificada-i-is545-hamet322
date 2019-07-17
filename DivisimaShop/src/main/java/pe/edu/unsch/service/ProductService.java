package pe.edu.unsch.service;

import java.util.List;

import pe.edu.unsch.entities.Product;

public interface ProductService {
	
	public Product find(Integer  id);
	public List<Product> featured(int n);
	public List<Product> latest(int n); 
		
	}


