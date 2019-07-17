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
 * Module generated by hbm2java
 */
@Entity
@Table(name = "module", catalog = "divisimabd")
public class Module implements java.io.Serializable {

	private Integer idmodule;
	private String name;
	private String icon;
	private Byte status;
	private Set<Submodule> submodules = new HashSet<Submodule>(0);

	public Module() {
	}

	public Module(String name, String icon, Byte status, Set<Submodule> submodules) {
		this.name = name;
		this.icon = icon;
		this.status = status;
		this.submodules = submodules;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "idmodule", unique = true, nullable = false)
	public Integer getIdmodule() {
		return this.idmodule;
	}

	public void setIdmodule(Integer idmodule) {
		this.idmodule = idmodule;
	}

	@Column(name = "name", length = 45)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "icon", length = 20)
	public String getIcon() {
		return this.icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	@Column(name = "status")
	public Byte getStatus() {
		return this.status;
	}

	public void setStatus(Byte status) {
		this.status = status;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "module")
	public Set<Submodule> getSubmodules() {
		return this.submodules;
	}

	public void setSubmodules(Set<Submodule> submodules) {
		this.submodules = submodules;
	}

}
