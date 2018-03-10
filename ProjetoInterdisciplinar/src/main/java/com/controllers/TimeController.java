package com.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.entities.Time;
import com.service.timeService;

@Controller
@RequestMapping(value="time")
public class TimeController {
	
	@Autowired
	timeService service;
	
	@RequestMapping(value="", method = RequestMethod.GET)
	public ModelAndView getPage() {
		ModelAndView view = new ModelAndView("time");
		return view;
	}
	@RequestMapping(value="/save", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> getSaved(Time time) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(service.saveOrUpdate(time)) {
			map.put("status", "200");
			map.put("message", "Time salvo com sucesso");		
		} else {
			map.put("status", "404");
			map.put("message", "Time não pode ser salvo");
		}
		return map;
	}
	@RequestMapping(value="/list", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> getAll(Time time) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<Time> lista = service.list();
		
		if(lista != null) {
			map.put("status", "200");
			map.put("message", "Times encontrados");
			map.put("data", lista);
		} else {
			map.put("status", "404");
			map.put("message", "Nenhum time encotrado");
		}
		return map;
	}
	@RequestMapping(value="/delete", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> delete(Time time) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(service.delete(time)) {
			map.put("status", "200");
			map.put("message", "Time excluido com sucesso");		
		} else {
			map.put("status", "404");
			map.put("message", "Time excluido com sucesso");	
		}
		return map;
	}
}
