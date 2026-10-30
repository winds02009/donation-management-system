package edu.sehs4701.edonor.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import edu.sehs4701.edonor.domain.Edonor;
import edu.sehs4701.edonor.service.EdonorService;
import edu.sehs4701.edonor.domain.Donation;
import edu.sehs4701.edonor.service.DonationService;

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
        model.addAttribute("edonor", new Edonor());
        return "admin";
    }

    @GetMapping("/Donation")
    public String addDonation(Model model) {
        model.addAttribute("donation", new Donation());
        return "Donation";
    }

    @PostMapping("/saveDonation")
    public String submitDonationForm(@ModelAttribute("donation") Donation donation, Model model) {
    	//String selected_program = request.getParameter("donation_program");
    	//model.addAttribute("selected_program", selected_program);
    	System.out.println(donation.getDonationProgram());
        donationService.save(donation);		
        return "redirect:/";
    }
    
    @PostMapping("/Donation/submit")
    public String handleDonation(
            @ModelAttribute("Donation") Donation donation,
            Model model) {
        // Validate the donation fields
        if (donation.getDonationProgram() == null || donation.getDonationProgram().isEmpty() ||
            donation.getDonationAmount() <= 0 ||
            donation.getClientName() == null || donation.getClientName() !=null ||
            donation.getEmail() == null || donation.getEmail().isEmpty()) {
            
            // Add error message and return to the form
            model.addAttribute("message", "Invalid donation details. Please fill out all fields correctly and try again.");
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
}