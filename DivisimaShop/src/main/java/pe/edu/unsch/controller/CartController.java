package pe.edu.unsch.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import pe.edu.unsch.entities.Account;
import pe.edu.unsch.entities.Item;
import pe.edu.unsch.entities.Orders;
import pe.edu.unsch.entities.Ordersdetail;
/*import pe.edu.unsch.service.AccountService;
import pe.edu.unsch.service.OrdersDetailService;
import pe.edu.unsch.service.OrdersService;*/
import pe.edu.unsch.service.ProductService;

@Controller
@RequestMapping("/cart")
public class CartController {
	
	@Autowired
	private ProductService productService;
	
	/*
	 * @Autowired private OrdersService ordersService;
	 * 
	 * @Autowired private AccountService accountService;
	 * 
	 * @Autowired private OrdersDetailService ordersDetailService;
	 */
	@GetMapping
	public String cart(Model model) {
		model.addAttribute("titulo", "Cart : e-commerce");
		return "views/public/cart/index";
	}
	
	@GetMapping("/buy/{id}")
	public String add(@PathVariable("id") int id, HttpSession session, Model model) {
		
		model.addAttribute("titulo", "Cart : e-commerce");
		
		if (session.getAttribute("cart") == null) {
			List<Item> cart = new ArrayList<Item>();
			cart.add(new Item(productService.find(id), 1));
			session.setAttribute("cart", cart);
		} else {
			List<Item> cart = (List<Item>) session.getAttribute("cart");
			int index = isEXists(id, session);
			
			if(index == -1) {
				cart.add(new Item(productService.find(id), 1));
			} else {
				int quantity = cart.get(index).getQuantity() + 1;
				cart.get(index).setQuantity(quantity);
				session.setAttribute("cart", cart); 
			}
			session.setAttribute("cart", cart);
		}
		
		return "views/public/cart/index";
	}
	
	@GetMapping("delete/{index}")
	public String delete(@PathVariable("index") int index, HttpSession session) {
		List<Item> cart = (List<Item>) session.getAttribute("cart");
		cart.remove(index);
		session.setAttribute("cart", cart);
		return "redirect:/cart";
	}

	private int isEXists(int id, HttpSession session) {
		List<Item> cart = (List<Item>) session.getAttribute("cart");
		
		for (int i = 0; i < cart.size(); i++) {
			if (cart.get(i).getProduct().getIdproduct() == id) {
				return i;
			}
		}
		
		return -1;
	}
	
	@PostMapping("/checkout")
	public String checkout(Model model, HttpSession session) {
		model.addAttribute("titulo", "Checkout : e-commerce");
		model.addAttribute("account", new Account());
		
		if (session.getAttribute("email") == null) {
			return "redirect:/account/register";
		} else {
			// Guardar Orden
			Orders orders = new Orders();
			
			Account account = accountService.find(session.getAttribute("email").toString());
			System.out.println(session.getAttribute("email").toString());
			
			orders.setAccount(account);

			orders.setDatecreation(new Date());
			orders.setName("New order");
			orders.setStatus((byte)0);
			Orders newOrder = ordersService.create(orders);
			
			// Guardar Detalle del orden
			List<Item> cart = (List<Item>) session.getAttribute("cart");

			for (Item item : cart) {
				
				System.out.println("Orders detail " + newOrder.getIdorders());

				Ordersdetail ordersdetail = new Ordersdetail();
				ordersdetail.setOrders(newOrder);
				ordersdetail.setProduct(item.getProduct());

				ordersdetail.setPrice(item.getProduct().getPrice());

				ordersdetail.setQuantity(item.getQuantity());
				ordersDetailService.create(ordersdetail);
			}
			
			// Limpiar carrito
			session.removeAttribute("cart");
			return "views/public/account/thanks";
		}
	}

}
