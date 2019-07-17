package pe.edu.unsch.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import pe.edu.unsch.entities.Category;
import pe.edu.unsch.service.CategoryService;

@ControllerAdvice
public class CommonControllerAdvice {

	@Autowired
	private CategoryService categoryService;

	@ModelAttribute
	public void addAttributes(Model model) {
		
		for (Category category : categoryService.findAll()) {
			System.out.println("Category: " + category.getName());
		}
		
		model.addAttribute("categories", categoryService.findAll());
	}

}
