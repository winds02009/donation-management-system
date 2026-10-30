package edu.sehs4701.edonor.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import edu.sehs4701.edonor.domain.Edonor;
import edu.sehs4701.edonor.repository.EdonorRepository;

@Service
public class EdonorService {
	@Autowired
	private EdonorRepository repo;

	public List<Edonor> listAll() {
		return repo.findAll();
	}

	public void save(Edonor edo) {
		repo.save(edo);
	}

	public Edonor get(long id) {
		return repo.findById(id).get();
	}

	public void delete(long id) {
		repo.deleteById(id);
	}
}