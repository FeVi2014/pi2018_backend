package com.dao;

import java.util.List;

import com.entities.Time;

public interface timeDao {
	public List<Time> list();
	public boolean delete(Time time);
	public boolean saveOrUpdate(Time time);
}
