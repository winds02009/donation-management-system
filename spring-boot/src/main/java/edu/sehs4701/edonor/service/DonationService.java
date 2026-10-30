package edu.sehs4701.edonor.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import edu.sehs4701.edonor.domain.Donation;
import edu.sehs4701.edonor.repository.DonationRepository;

@Service
public class DonationService {
	@Autowired
	private DonationRepository repo;

	public List<Donation> listAll() {
		return repo.findAll();
	}

	// Filter donations; blank program / email means "any"
	public List<Donation> search(int minAmount, int maxAmount, String program, String email) {
		if (program != null && program.isBlank()) {
			program = null;
		}
		if (email != null && email.isBlank()) {
			email = null;
		}
		return repo.findByCriteria(minAmount, maxAmount, program, email == null ? null : email.trim());
	}

	public void save(Donation don) {
		repo.save(don);
	}

	public Donation get(long id) {
		return repo.findById(id).get();
	}

	public void delete(long id) {
		repo.deleteById(id);
	}
}