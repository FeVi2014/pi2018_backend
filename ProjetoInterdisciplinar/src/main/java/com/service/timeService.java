package com.service;

import java.util.List;

import com.entities.Time;

public interface timeService {
	public List<Time> list();
	public boolean delete(Time time);
	public boolean saveOrUpdate(Time time);
}
