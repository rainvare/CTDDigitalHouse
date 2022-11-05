package com.dh.Wesped.Repository;

import com.dh.Wesped.Model.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product, Integer> {

    List<Product> findByCategoryId(Integer category_id);

    List<Product> findByCityId(Integer city_id);

    @Query(value = "select * from product left join booking on product.id = booking.product_id where" +
            "((booking.checkin not between ?1 and ?2) " +
            "or (booking.checkin is null)) and ((booking.checkout not between ?1 and ?2) " +
            "or (booking.checkout is null)) group by product.id", nativeQuery = true)
    List<Product> findProductsByDates(LocalDate checkin, LocalDate checkout);

    @Query(value = "select * from product left join booking on product.id = booking.product_id where" +
            "((booking.checkin not between ?1 and ?2) or (booking.checkin is null))" +
            "and ((booking.checkout not between ?1 and ?2) or (booking.checkout is null))" +
            "and (product.cities_id = ?3) group by product.id", nativeQuery = true)
    List<Product> findProductsByDatesAndCity(LocalDate checkin, LocalDate checkout, Integer cityId);
}