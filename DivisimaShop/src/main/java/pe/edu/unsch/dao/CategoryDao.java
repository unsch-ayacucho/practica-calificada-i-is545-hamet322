package pe.edu.unsch.dao;

import java.util.List;

import pe.edu.unsch.entities.Category;

public interface CategoryDao {
	public List<Category> findAll();
	public Category find(Integer id);

}
