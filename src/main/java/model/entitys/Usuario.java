package model.entitys;

import jakarta.persistence.*;

@Entity
public class Usuario extends Cuenta{
	
	@Column
	private String cedula;
	
	public Usuario(){
		
	}

	public Usuario(String nombre, String correo, String cedula) {
		super(nombre, correo);
		this.cedula = cedula;
	}

	
	
	
}
