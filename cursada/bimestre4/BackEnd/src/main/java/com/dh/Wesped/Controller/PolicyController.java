package com.dh.Wesped.Controller;

import com.dh.Wesped.Exceptions.BadRequestException;
import com.dh.Wesped.Model.Policy;
import com.dh.Wesped.Service.PolicyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("/policies")
public class PolicyController {

    private PolicyService policyService;

    @Autowired
    public PolicyController(PolicyService policyService) {
        this.policyService = policyService;
    }

    @PostMapping
    public ResponseEntity<Policy> policyRegister(@RequestBody Policy policy) {
        return ResponseEntity.ok(policyService.save(policy));
    }

    @GetMapping
    public ResponseEntity<List<Policy>> listAll() {
        return ResponseEntity.ok(policyService.listAll());
    }

    @GetMapping("/{id}")
    public ResponseEntity<Policy> findById(@PathVariable Integer id) throws BadRequestException {
        return ResponseEntity.ok(policyService.findById(id));
    }
}