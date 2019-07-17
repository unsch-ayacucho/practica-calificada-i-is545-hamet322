package pe.edu.unsch.service;

import java.util.List;

import pe.edu.unsch.entities.Category;

public interface CategoryService {
	public List<Category> findAll();
	public Category find(Integer id);

}
