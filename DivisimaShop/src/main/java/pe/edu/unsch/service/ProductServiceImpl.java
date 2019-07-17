package pe.edu.unsch.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pe.edu.unsch.dao.ProductDao;
import pe.edu.unsch.entities.Product;

@Service("productService")
@Transactional
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	ProductDao productDao;

	@Override
	public Product find(Integer id) {
		return productDao.find(id);
	}

	@Override
	public List<Product> featured(int n) {
		return productDao.featured(n);
	}

	@Override
	public List<Product> latest(int n) {	
		return productDao.latest(n);
	}

}
