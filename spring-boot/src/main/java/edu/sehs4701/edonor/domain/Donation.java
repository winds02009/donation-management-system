package edu.sehs4701.edonor.domain;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Donation {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long donationID;
    private String donationName;
    private String email;
    private String donationProgram;
    private double donationAmount;

    public Donation() {
        super();
    }

    public Donation(Long donationID, String donationName, String email, String donationProgram, double donationAmount) {
        super();
        this.donationID = donationID;
        this.donationName = donationName;
        this.email = email;
        this.donationProgram = donationProgram;
        this.donationAmount = donationAmount;
    }

    public Long getDonationID() {
        return donationID;
    }

    public void setDonationID(Long donationID) {
        this.donationID = donationID;
    }

    public String getDonationName() {
        return donationName;
    }

    public void setDonationName(String donationName) {
        this.donationName = donationName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDonationProgram() {
        return donationProgram;

    }

    public void setDonationProgram(String donationProgram) {
        this.donationProgram = donationProgram;
    }

    public double getDonationAmount() {
        return donationAmount;
    }

    public void setDonationAmount(double donationAmount) {
        this.donationAmount = donationAmount;
    }

	public Object getClientName() {
		// TODO Auto-generated method stub
		return null;
	}
}