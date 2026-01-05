package model.entitys;

import java.io.Serializable;

import jakarta.persistence.*;
@Entity
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
public class Cuenta implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@Column(name = "nombre")
	private String nombre;
	@Column(name = "correo")
	private String correo;
	public Cuenta() {
		
	}
	public Cuenta(String nombre, String correo) {
		this.nombre = nombre;
		this.correo = correo;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getCorreo() {
		return correo;
	}
	public void setCorreo(String correo) {
		this.correo = correo;
	}
	
	
	
	
}
