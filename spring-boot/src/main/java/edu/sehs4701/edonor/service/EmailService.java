package edu.sehs4701.edonor.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailService {

    @Autowired
    private JavaMailSender mailSender;

    public void sendAcknowledgment(String toEmail, String donorName, String donationProgram, double amount) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(toEmail);
        message.setSubject("Thank You for Your Donation!");
        message.setText(buildMessage(donorName, donationProgram, amount));
        mailSender.send(message);
    }

    private String buildMessage(String donorName, String donationProgram, double amount) {
        return "Dear " + donorName + ",\n\n" +
               "Thank you for your generous donation of HKD " + amount + " to our " + donationProgram + ".\n" +
               "Your contribution is greatly appreciated and helps us continue our mission.\n\n" +
               "Sincerely,\n" +
               "The Hong Kong Homeless Care Team";
    }
}
