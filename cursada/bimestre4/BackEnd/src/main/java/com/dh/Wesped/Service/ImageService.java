package com.dh.Wesped.Service;

import com.dh.Wesped.Exceptions.BadRequestException;
import com.dh.Wesped.Model.Image;
import com.dh.Wesped.Repository.ImageRepository;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ImageService {

    private static final Logger logger = Logger.getLogger(ImageService.class);
    private ImageRepository imageRepository;

    @Autowired
    public ImageService(ImageRepository imageRepository) {
        this.imageRepository = imageRepository;
    }

    public Image save(Image image) {
        logger.debug("Guardando nueva imagen: " + image);
        return imageRepository.save(image);
    }

    public List<Image> listAll() {
        logger.debug("Encontramos estas imagenes: ");
        return imageRepository.findAll();
    }

    public Image findById(Integer id) throws BadRequestException {

        logger.debug("Buscando imagen con id: " + id);

        if (imageRepository.findById(id).isEmpty()) {
            logger.debug("No se encontro imagen con id " + id);
            throw new BadRequestException("No se encontro imagen con id " + id);
        } else {
            logger.debug("Se encontro imagen con id: ");
            return imageRepository.findById(id).get();
        }

    }
}