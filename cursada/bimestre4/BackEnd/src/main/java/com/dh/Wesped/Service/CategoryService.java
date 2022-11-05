package com.dh.Wesped.Service;

import com.dh.Wesped.Exceptions.BadRequestException;
import com.dh.Wesped.Exceptions.ResourceNotFoundException;
import com.dh.Wesped.Model.Category;
import com.dh.Wesped.Repository.CategoryRepository;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CategoryService {

    private static final Logger logger = Logger.getLogger(CategoryService.class);
    private CategoryRepository categoryRepository;

    @Autowired
    public CategoryService(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }

    public Category save(Category category) {
        logger.debug("Guardando nueva categoria: " + category);
        return categoryRepository.save(category);
    }

    public List<Category> listAll() {
        logger.debug("Encontramos estas categorias: ");
        return categoryRepository.findAll();
    }

    public Category findById(Integer id) throws BadRequestException {

        logger.debug("Buscando categorias");

        if (categoryRepository.findById(id).isEmpty()) {
            logger.debug("No se encontro categoría con id " + id);
            throw new BadRequestException("No se encontro categoria con id " + id);
        } else {
            logger.debug("Se encontro categoria con id: ");
            return categoryRepository.findById(id).get();
        }

    }

    public void deleteById(Integer id) throws ResourceNotFoundException, BadRequestException {
        Optional<Category> categorySearched = Optional.ofNullable(findById(id));
        if (categorySearched.isPresent()) {
            categoryRepository.deleteById(id);
            /*categoryRepository.resetAutoIncrement();*/
        } else {
            throw new ResourceNotFoundException("No encontramos categoria con id: " + id);
        }
    }

    public Category editCategory(Category category) throws BadRequestException {
        Optional<Category> categorySearched = Optional.ofNullable(findById(category.getId()));
        if (categorySearched.isPresent()) {
            return categoryRepository.save(category);
        } else {
            throw new BadRequestException("La categoria con id: " + category.getId() + " no se pudo actualizar");
        }
    }
}