package com.dh.Wesped.Service;

import com.dh.Wesped.Exceptions.BadRequestException;
import com.dh.Wesped.Model.City;
import com.dh.Wesped.Repository.CityRepository;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CityService {
    private static final Logger logger = Logger.getLogger(CityService.class);
    private CityRepository cityRepository;

    @Autowired
    public CityService(CityRepository cityRepository) {
        this.cityRepository = cityRepository;
    }

    public City save(City city) {
        logger.debug("Guardando nueva ciudad: " + city);
        return cityRepository.save(city);
    }

    public List<City> listAll() {
        logger.debug("Encontramos estas ciudades: ");
        return cityRepository.findAll();
    }

    public City findById(Integer id) throws BadRequestException {

        logger.debug("Buscando ciudad con id: " + id);

        if (cityRepository.findById(id).isEmpty()) {
            logger.debug("No se encontro ciudad con id " + id);
            throw new BadRequestException("No se encontro ciudad con id " + id);
        } else {
            logger.debug("Se encontro ciudad con id: ");
            return cityRepository.findById(id).get();
        }

    }
}