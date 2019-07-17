package pe.edu.unsch.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import pe.edu.unsch.entities.Product;

@Repository("productDao")
public class ProductDaoImpl implements ProductDao {
	
	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public Product find(Integer id) {
		return (Product) entityManager
				.find(Product.class, id);
	}

	@Override
	public List<Product> featured(int n) {
		return entityManager
				.createQuery("from Product "
						+ "where feature =: feature "
						+ "order by id desc", Product.class)
				.setParameter("feature", (byte)1)
				.setMaxResults(n)
				.getResultList();
	}

	@Override
	public List<Product> latest(int n) {
		return entityManager
				.createQuery("from Product order by id desc", Product.class)
				.setMaxResults(n)
				.getResultList();
	}

}
