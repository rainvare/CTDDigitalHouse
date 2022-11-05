package com.dh.Wesped.Controller;

import com.dh.Wesped.Exceptions.BadRequestException;
import com.dh.Wesped.Exceptions.ResourceNotFoundException;
import com.dh.Wesped.Model.Category;
import com.dh.Wesped.Service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("/categories")
public class CategoryController {

    private CategoryService categoryService;

    @Autowired
    public CategoryController(CategoryService categoryService) {
        this.categoryService = categoryService;
    }

    @PostMapping
    public ResponseEntity<Category> categoryRegister(@RequestBody Category category) {
        return ResponseEntity.ok(categoryService.save(category));
    }

    @GetMapping
    public ResponseEntity<List<Category>> listAll() {
        return ResponseEntity.ok(categoryService.listAll());
    }

    @GetMapping("/{id}")
    public ResponseEntity<Category> findById(@PathVariable Integer id) throws BadRequestException {
        Category category = categoryService.findById(id);
        return ResponseEntity.ok(categoryService.findById(id));
    }


    @DeleteMapping("/{id}")
    public ResponseEntity<String> delete(@PathVariable Integer id) throws ResourceNotFoundException, BadRequestException {
        categoryService.deleteById(id);
        return ResponseEntity.ok("La categoria con id " + id + " fue eliminada exitosamente");

    }

    @PutMapping
    public ResponseEntity<Category> editCategory(@RequestBody Category category) throws BadRequestException {
        Category editedCategory = categoryService.editCategory(category);
        return ResponseEntity.ok(editedCategory);
    }
}