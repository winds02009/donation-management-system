package edu.sehs4701.edonor.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import edu.sehs4701.edonor.domain.Edonor;
import edu.sehs4701.edonor.repository.EdonorRepository;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletResponse;

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

	public boolean validateUser(String userid, String password,  HttpServletResponse response) {
		List<Edonor> listedonor = listAll();
		for (Edonor edonor : listedonor) {
			// System.out.println(userid);
			// System.out.println(edonor.getEmail());
			// System.out.println(password);
			// System.out.println(edonor.getPassword());
			if (userid.equals(edonor.getEmail()) && password.equals(edonor.getPassword())) {
				Cookie UseremailCookie = new Cookie("Useremail", edonor.getEmail());
				Cookie UsernameCookie = new Cookie("Usename", edonor.getEdonorname());
				UseremailCookie.setMaxAge(60*60*24);
				response.addCookie(UseremailCookie);
				return true;
			}
		}
		return false;
	}
	
	
	
}
