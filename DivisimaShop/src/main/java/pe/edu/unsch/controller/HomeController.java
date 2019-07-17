package pe.edu.unsch.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import pe.edu.unsch.service.ProductService;

@Controller
public class HomeController {
	@Autowired
	private ProductService productService;
	
	@GetMapping({"/", "/home"})
	//@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String index(Model model) {
		model.addAttribute("titulo", "Eshop : e-commerce");
		model.addAttribute("classActive","active");
		model.addAttribute("featuredProducts", productService.featured(5));
		model.addAttribute("productlatest", productService.latest(3));
		return "views/public/home/index";
	}

}
