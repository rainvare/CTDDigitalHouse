package com.dh.Wesped.Service;

import com.dh.Wesped.Exceptions.BadRequestException;
import com.dh.Wesped.Model.Product;
import com.dh.Wesped.Repository.ProductRepository;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.time.LocalDate;
import java.util.List;

@Service
public class ProductService {

    private static final Logger logger = Logger.getLogger(ProductService.class);
    private ProductRepository productRepository;

    @Autowired
    public ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    public Product save(Product product) {
        logger.debug("Guardando nuevo producto: " + product);
        return productRepository.save(product);
    }

    public List<Product> listAll() {
        logger.debug("Encontramos estos productos: ");
        return productRepository.findAll();
    }

    public Product findById(Integer id) throws BadRequestException {

        logger.debug("Buscando producto con: " + id);

        if (productRepository.findById(id).isEmpty()) {
            logger.debug("No se encontro producto con id " + id);
            throw new BadRequestException("No se encontro producto con id " + id);
        } else {
            logger.debug("Se encontro producto con id: ");
            return productRepository.findById(id).get();
        }

    }

    public List<Product> filterByCategory(Integer id) {
        logger.debug("Buscando productos con categoria id: " + id);
        return productRepository.findByCategoryId(id);
    }

    public List<Product> filterByCity(Integer id) {
        logger.debug("Buscando productos con ciudad id: " + id);
        return productRepository.findByCityId(id);
    }

    //@Transactional
    public List<Product> filterByDates(LocalDate checkin, LocalDate checkout) {
        logger.debug("Buscando productos sin reservas entre el: " + checkin + " y el " + checkout);
        return productRepository.findProductsByDates(checkin, checkout);
    }

    //@Transactional
    public List<Product> filterByDatesAndCity(LocalDate checkin, LocalDate checkout, Integer cityId) {
        logger.debug("Buscando productos sin reservas entre el: " + checkin + " y el " + checkout +
                " ubicados en la ciudad con id: " + cityId);
        return productRepository.findProductsByDatesAndCity(checkin, checkout, cityId);
    }
}