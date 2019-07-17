package pe.edu.unsch.entities;
// Generated 16/07/2019 01:54:40 PM by Hibernate Tools 5.1.10.Final

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Category generated by hbm2java
 */
@Entity
@Table(name = "category", catalog = "divisimabd")
public class Category implements java.io.Serializable {

	private Integer idcategory;
	private String name;
	private Integer status;
	private Integer parentid;
	private Set<Product> products = new HashSet<Product>(0);

	public Category() {
	}

	public Category(String name, Integer status, Integer parentid, Set<Product> products) {
		this.name = name;
		this.status = status;
		this.parentid = parentid;
		this.products = products;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "idcategory", unique = true, nullable = false)
	public Integer getIdcategory() {
		return this.idcategory;
	}

	public void setIdcategory(Integer idcategory) {
		this.idcategory = idcategory;
	}

	@Column(name = "name", length = 45)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "status")
	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	@Column(name = "parentid")
	public Integer getParentid() {
		return this.parentid;
	}

	public void setParentid(Integer parentid) {
		this.parentid = parentid;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "category")
	public Set<Product> getProducts() {
		return this.products;
	}

	public void setProducts(Set<Product> products) {
		this.products = products;
	}

}
