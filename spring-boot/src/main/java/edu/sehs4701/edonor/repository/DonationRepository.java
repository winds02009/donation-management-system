package edu.sehs4701.edonor.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import edu.sehs4701.edonor.domain.Donation;

@Repository
public interface DonationRepository extends JpaRepository<Donation, Long> {

	// Requirement 3: organisation views donations by criteria.
	// Any criterion passed as null is ignored.
	@Query("SELECT d FROM Donation d WHERE d.donationAmount >= :minAmount AND d.donationAmount <= :maxAmount"
			+ " AND (:program IS NULL OR d.donationProgram = :program)"
			+ " AND (:email IS NULL OR LOWER(d.email) LIKE LOWER(CONCAT('%', :email, '%')))"
			+ " ORDER BY d.donationAmount DESC")
	List<Donation> findByCriteria(@Param("minAmount") int minAmount, @Param("maxAmount") int maxAmount,
			@Param("program") String program, @Param("email") String email);

	List<Donation> findByEmailIgnoreCase(String email);
}