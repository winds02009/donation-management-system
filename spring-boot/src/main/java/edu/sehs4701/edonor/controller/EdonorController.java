package edu.sehs4701.edonor.controller;

import java.util.List;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Cookie;

import jakarta.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import edu.sehs4701.edonor.domain.Edonor;
import edu.sehs4701.edonor.service.EdonorService;
import edu.sehs4701.edonor.domain.Donation;
import edu.sehs4701.edonor.service.DonationService;
import org.springframework.ui.ModelMap;

@Controller
public class EdonorController {

	@Autowired
	private EdonorService edonorService;

	@Autowired
	private DonationService donationService;

	@GetMapping("/")
	public String home(Model model) {
		List<Edonor> listedonor = edonorService.listAll();
		model.addAttribute("listedonor", listedonor);
		return "home";
	}

	@GetMapping("/admin")
	public String addAdmin(Model model) {
		List<Donation> listdonation = donationService.listAll();
		model.addAttribute("listdonation", listdonation);
		model.addAttribute("minAmount", 0);
		model.addAttribute("maxAmount", 2000000000);
		model.addAttribute("program", "");
		model.addAttribute("email", "");
		return "admin";
	}

	@PostMapping("/referlogin")
	public String submitloginForm(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
		String Useremail = request.getParameter("username");
		String Userpassword = request.getParameter("password");
		String Username = request.getParameter("edonorname");

		boolean valid = edonorService.validateUser(Useremail, Userpassword, response);
		if (valid) {
			model.put("name", "edonorname");
			return "redirect:/userhome";
		} else {
			model.put("error", "Your Username or Password is incorrect! Please try again");
			// System.out.println("passed to else");
			return "Login";
		}
	}

	@PostMapping("/referadmin")
	public String submitadminForm(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
		String Username = request.getParameter("edonorname");
		String Userpassword = request.getParameter("password");

		boolean valid = edonorService.validateUser(Username, Userpassword, response);
		if (valid) {
			return "redirect:/admin";
		} else {
			model.put("error", "Your Username or Password is incorrect! Please try again");
			// System.out.println("passed to else");
			return "Login";
		}
	}

	@GetMapping("/login")
	public String gotologinForm(Model model) {
		return "Login";
	}

	@GetMapping("/userhome")
	public String gotoUserHomeForm(Model model) {
		return "userhome";
	}

	@GetMapping("/Donation")
	public String addDonation(Model model) {
		model.addAttribute("donation", new Donation());
		return "Donation";
	}

	@PostMapping("/saveDonation")
	public String submitDonationForm(@ModelAttribute("donation") Donation donation, Model model,
			HttpServletResponse response) {

		// Save Donation into MYSQL
		// System.out.println(donation.getDonationProgram());
		donationService.save(donation);

		// Create cookies for each variable
		Cookie nameCookie = new Cookie("username", donation.getDonationName().replace(" ", "_"));
		Cookie programCookie = new Cookie("program", donation.getDonationProgram().replace(" ", "_"));
		Cookie emailCookie = new Cookie("email", donation.getEmail().replace(" ", "_"));
		Cookie amountCookie = new Cookie("amount", Integer.toString(donation.getDonationAmount()));

		// Set the maximum age for each cookie (in seconds)
		int maxAge = 60 * 60 * 24; // 1 day
		nameCookie.setMaxAge(maxAge);
		programCookie.setMaxAge(maxAge);
		emailCookie.setMaxAge(maxAge);
		amountCookie.setMaxAge(maxAge);

		// Add Cookie using HttpServletResponse
		response.addCookie(nameCookie);
		response.addCookie(programCookie);
		response.addCookie(emailCookie);
		response.addCookie(amountCookie);

		return "redirect:/Success";
	}

	@GetMapping("/Success")
	public String toSuccess(Model model) {
		return "Success";
	}

	@GetMapping("/after-donation")
	public String destroyDonationCookie(Model model, HttpServletResponse response) {
		Cookie nameCookie = new Cookie("username", null);
		Cookie programCookie = new Cookie("program", null);
		Cookie emailCookie = new Cookie("email", null);
		Cookie amountCookie = new Cookie("amount", null);

		// Set the maximum age for each cookie (in seconds)
		int maxAge = 0; // 1 day
		nameCookie.setMaxAge(maxAge);
		programCookie.setMaxAge(maxAge);
		emailCookie.setMaxAge(maxAge);
		amountCookie.setMaxAge(maxAge);

		// Add Cookie using HttpServletResponse
		response.addCookie(nameCookie);
		response.addCookie(programCookie);
		response.addCookie(emailCookie);
		response.addCookie(amountCookie);
		return "redirect:/";
	}

	@GetMapping("/logout")
	public String destroyLoginCookie(Model model, HttpServletResponse response) {
		Cookie userEmailCookie = new Cookie("Useremail", null);
		userEmailCookie.setMaxAge(0);
		response.addCookie(userEmailCookie);

		return "redirect:/";
	}

	@PostMapping("/Donation/submit")
	public String handleDonation(@ModelAttribute("Donation") Donation donation, Model model) {
		// Validate the donation fields
		if (donation.getDonationProgram() == null || donation.getDonationProgram().isEmpty()
				|| donation.getDonationAmount() <= 0 || donation.getClientName() == null
				|| donation.getClientName() != null || donation.getEmail() == null || donation.getEmail().isEmpty()) {

			// Add error message and return to the form
			model.addAttribute("message",
					"Invalid donation details. Please fill out all fields correctly and try again.");
			return "Donation"; // Return to the `Donation.jsp` page
		}

		// Save the donation (assuming the donationService is implemented)
		donationService.save(donation);

		// Add the donation object to the model, so it can be accessed in Success.jsp
		model.addAttribute("donation", donation);

		// Redirect to the Success.jsp page
		return "Success"; // View resolver will map this to `Success.jsp`
	}

	@GetMapping("/new")
	public String addNewEdonor(Model model) {
		model.addAttribute("edonor", new Edonor());
		return "new";
	}

	@GetMapping("/view-donations")
	public String listDonation(Model model,
			@RequestParam(name = "minAmount", required = false, defaultValue = "0") int minAmount,
			@RequestParam(name = "maxAmount", required = false, defaultValue = "2000000000") int maxAmount,
			@RequestParam(name = "program", required = false) String program,
			@RequestParam(name = "email", required = false) String email) {
		if (minAmount > maxAmount) {
			int tmp = minAmount;
			minAmount = maxAmount;
			maxAmount = tmp;
		}
		List<Donation> listdonation = donationService.search(minAmount, maxAmount, program, email);
		int total = 0;
		for (Donation d : listdonation) {
			total += d.getDonationAmount();
		}
		model.addAttribute("listdonation", listdonation);
		model.addAttribute("minAmount", minAmount);
		model.addAttribute("maxAmount", maxAmount);
		model.addAttribute("program", program == null ? "" : program);
		model.addAttribute("email", email == null ? "" : email);
		model.addAttribute("total", total);
		return "admin";
	}
	
	@GetMapping("/user-history")
	public String listUserDonation(Model model, HttpServletRequest request, HttpServletResponse response) {
		List<Donation> listdonation = donationService.listAll();
		model.addAttribute("listdonation", listdonation);

		return "userDonationHistory";
	}

	@GetMapping("/edonordb")
	public String listEdonors(Model model) {
		List<Edonor> listedonor = edonorService.listAll();
		model.addAttribute("listedonor", listedonor);
		return "edonordb";
	}

	@PostMapping("/save")
	public String submitEdonorForm(@ModelAttribute("edonor") Edonor edonor) {
		edonorService.save(edonor);
		return "redirect:/";
	}

	@GetMapping("/edit/{id}")
	public ModelAndView showEditEdonorPage(@PathVariable(name = "id") int id) {
		ModelAndView mav = new ModelAndView("new");
		Edonor edonor = edonorService.get(id);
		mav.addObject("edonor", edonor);
		return mav;
	}

	@GetMapping("/delete/{id}")
	public String deleteEdonor(@PathVariable(name = "id") int id) {
		edonorService.delete(id);
		return "redirect:/";
	}

	@GetMapping("/deletedonation/{id}")
	public String deletedonation(@PathVariable(name = "id") int id) {
		donationService.delete(id);
		return "redirect:/admin";
	}
}