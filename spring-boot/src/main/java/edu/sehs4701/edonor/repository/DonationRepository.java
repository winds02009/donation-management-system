package edu.sehs4701.edonor.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import edu.sehs4701.edonor.domain.Donation;

@Repository
public interface DonationRepository extends JpaRepository<Donation, Long> {
}