package com.daoImpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.dao.timeDao;
import com.entities.Time;

@Repository
@Transactional
public class timeDaoImpl implements timeDao{
	
	@Autowired
	SessionFactory session;
	
	@SuppressWarnings("unchecked")
	public List<Time> list() {
		return session.getCurrentSession().createQuery("from Time where excluido = 0").list();		
	}
	public boolean delete(Time time) {
		try {
			time.setexcluido(1);
			session.getCurrentSession().saveOrUpdate(time);
		}catch(Exception ex) {
			return false;
		}
		return true;
	}
	public boolean saveOrUpdate(Time time) {
		try {
			session.getCurrentSession().saveOrUpdate(time);
		}catch(Exception ex) {
			return false;
		}
		return true;
	}

}
