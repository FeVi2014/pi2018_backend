package com.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.entities.Time;
import com.service.timeService;

@Service
public class timeServiceImpl implements timeService{
	
	@Autowired
	com.dao.timeDao dao;
	
	public List<Time> list() {
		return dao.list();
	}

	public boolean delete(Time time) {
		return dao.delete(time);
	}

	public boolean saveOrUpdate(Time time) {
		return dao.saveOrUpdate(time);
	}
	

}
