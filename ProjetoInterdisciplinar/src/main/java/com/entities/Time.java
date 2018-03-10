package com.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="time")
public class Time {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="id_time")
	public int id;
	
	@Column(name="nome_time")
	private String nome;
	
	@Column(name="logo_time")
	private String logo;
	
	public int getid() {
		return id;
	}
	public void setid(int id) {
		this.id = id;
	}
	public String getnome() {
		return nome;
	}
	public void setnome(String nome) {
		this.nome = nome;
	}
	public String getlogo() {
		return logo;
	}
	public void setlogo(String logo) {
		this.logo = logo;
	}	
}
