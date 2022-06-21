package com.example.mdt.service;

import com.example.mdt.persistence.entities.Producto;
import com.example.mdt.persistence.repository.ProductoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductoService {
    @Autowired
    ProductoRepository repository;

    public String save(Producto p){
        if(repository.save(p) != null){
            return "OK";
        } else {
            return null;
        }
    }

    public List<Producto> obtenerTodos() {
        return repository.findAll();
    }

    public String eliminarProducto(Long id) {
        if(repository.findById(id).isPresent()){
            String productName = repository.getReferenceById(id).getNombre();
            repository.deleteById(id);
            return "Producto id: " + id + ", nombre: " + productName + " fué eliminado.";
        }
        return "Producto id: " + id + " no fué encontrado.";
    }

    public String modificarProducto(Producto p){
        Long productoId = p.getId();

        String respuesta = "";

        if(repository.findById(productoId).isPresent()) {
            Producto productoAModificar = repository.getReferenceById(productoId);
            productoAModificar.setCantidad(p.getCantidad());
            productoAModificar.setDescripcion(p.getDescripcion());
            productoAModificar.setNombre(p.getNombre());
            repository.save(productoAModificar);

            respuesta = "El producto con Id: " + productoId  + " fué modificado.";
        } else {
            respuesta = "El producto con Id: " + productoId  + " no existe.";
        }
        return respuesta;
    }
}
