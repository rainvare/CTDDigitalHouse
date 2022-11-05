package com.dh.Wesped.Repository;

import com.dh.Wesped.Model.Category;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/*@Transactional*/
@Repository
public interface CategoryRepository extends JpaRepository<Category, Integer> {

    /*@Modifying
    @Query(value = "ALTER TABLE `categories` AUTO_INCREMENT = 4;", nativeQuery = true)
    void resetAutoIncrement();*/
}