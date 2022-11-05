package com.dh.Wesped.Controller;

import com.dh.Wesped.Exceptions.BadRequestException;
import com.dh.Wesped.Model.Image;
import com.dh.Wesped.Service.ImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("/images")
public class ImageController {

    private ImageService imageService;

    @Autowired
    public ImageController(ImageService imageService) {
        this.imageService = imageService;
    }

    @PostMapping
    public ResponseEntity<Image> imageRegister(@RequestBody Image image) {
        return ResponseEntity.ok(imageService.save(image));
    }

    @GetMapping
    public ResponseEntity<List<Image>> listAll() {
        return ResponseEntity.ok(imageService.listAll());
    }

    @GetMapping("/{id}")
    public ResponseEntity<Image> findById(@PathVariable Integer id) throws BadRequestException {
        return ResponseEntity.ok(imageService.findById(id));
    }
}