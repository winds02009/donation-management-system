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