package com.dh.Wesped.Controller;

import com.dh.Wesped.Exceptions.BadRequestException;
import com.dh.Wesped.Model.Feature;
import com.dh.Wesped.Service.FeatureService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("/features")
public class FeatureController {

    private FeatureService featureService;

    @Autowired
    public FeatureController(FeatureService featureService) {
        this.featureService = featureService;
    }

    @PostMapping
    public ResponseEntity<Feature> featureRegister(@RequestBody Feature feature) {
        return ResponseEntity.ok(featureService.save(feature));
    }

    @GetMapping
    public ResponseEntity<List<Feature>> listAll() {
        return ResponseEntity.ok(featureService.listAll());
    }

    @GetMapping("/{id}")
    public ResponseEntity<Feature> findById(@PathVariable Integer id) throws BadRequestException {
        return ResponseEntity.ok(featureService.findById(id));
    }
}