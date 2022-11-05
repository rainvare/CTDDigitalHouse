package com.dh.Wesped.Service;

import com.dh.Wesped.Exceptions.BadRequestException;
import com.dh.Wesped.Model.Policy;
import com.dh.Wesped.Repository.PolicyRepository;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PolicyService {

    private static final Logger logger = Logger.getLogger(PolicyService.class);
    private PolicyRepository policyRepository;

    @Autowired
    public PolicyService(PolicyRepository policyRepository) {
        this.policyRepository = policyRepository;
    }

    public Policy save(Policy policy) {
        logger.debug("Guardando nueva politica: " + policy);
        return policyRepository.save(policy);
    }

    public List<Policy> listAll() {
        logger.debug("Encontramos estas politicas: ");
        return policyRepository.findAll();
    }

    public Policy findById(Integer id) throws BadRequestException {

        logger.debug("Buscando politica con id: " + id);

        if (policyRepository.findById(id).isEmpty()) {
            logger.debug("No se encontro politica con id " + id);
            throw new BadRequestException("No se encontro politica con id " + id);
        } else {
            logger.debug("Se encontro politica con id: ");
            return policyRepository.findById(id).get();
        }

    }
}
