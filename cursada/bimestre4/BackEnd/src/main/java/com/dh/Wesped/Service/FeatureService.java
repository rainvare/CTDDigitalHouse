package com.dh.Wesped.Service;

import com.dh.Wesped.Exceptions.BadRequestException;
import com.dh.Wesped.Model.Feature;
import com.dh.Wesped.Repository.FeatureRepository;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FeatureService {

    private static final Logger logger = Logger.getLogger(FeatureService.class);
    private FeatureRepository featureRepository;

    @Autowired
    public FeatureService(FeatureRepository featureRepository) {
        this.featureRepository = featureRepository;
    }

    public Feature save(Feature feature) {
        logger.debug("Guardando nueva caracteristica: " + feature);
        return featureRepository.save(feature);
    }

    public List<Feature> listAll() {
        logger.debug("Encontramos estas caracteristicas: ");
        return featureRepository.findAll();
    }

    public Feature findById(Integer id) throws BadRequestException {

        logger.debug("Buscando caracteristica con id: " + id);

        if (featureRepository.findById(id).isEmpty()) {
            logger.debug("No se encontro caracteristica con id " + id);
            throw new BadRequestException("No se encontro caracteristica con id " + id);
        } else {
            logger.debug("Se encontro caracteristica con id: ");
            return featureRepository.findById(id).get();
        }

    }
}