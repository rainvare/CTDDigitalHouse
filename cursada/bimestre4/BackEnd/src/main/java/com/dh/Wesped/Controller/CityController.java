package com.dh.Wesped.Controller;

import com.dh.Wesped.Exceptions.BadRequestException;
import com.dh.Wesped.Model.City;
import com.dh.Wesped.Service.CityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("/cities")
public class CityController {

    private CityService cityService;

    @Autowired
    public CityController(CityService cityService) {
        this.cityService = cityService;
    }

    @PostMapping
    public ResponseEntity<City> cityRegister(@RequestBody City city) {
        return ResponseEntity.ok(cityService.save(city));
    }

    @GetMapping
    public ResponseEntity<List<City>> listAll() {
        return ResponseEntity.ok(cityService.listAll());
    }

    @GetMapping("/{id}")
    public ResponseEntity<City> findById(@PathVariable Integer id) throws BadRequestException {
        return ResponseEntity.ok(cityService.findById(id));
    }
}
