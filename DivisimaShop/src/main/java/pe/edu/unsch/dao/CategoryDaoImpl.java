package pe.edu.unsch.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;

import pe.edu.unsch.entities.Category;

@Repository("categoryDao")
public class CategoryDaoImpl implements CategoryDao {
	
	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public List<Category> findAll() {
		return (List<Category>) entityManager
				.createQuery("from Category where parentid=0", Category.class)
				.getResultList();
	}

	@Override
	public Category find(Integer id) {
		return (Category) entityManager
				.find(Category.class, id);
	}

}
	

	
