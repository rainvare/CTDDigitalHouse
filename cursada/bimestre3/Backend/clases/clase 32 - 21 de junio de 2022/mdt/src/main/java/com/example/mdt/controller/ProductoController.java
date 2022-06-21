package com.example.mdt.controller;

import com.example.mdt.persistence.entities.Producto;
import com.example.mdt.service.ProductoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/productos")
public class ProductoController {
    @Autowired
    ProductoService service;

    @PostMapping("/crear")
    public ResponseEntity<String> crear(@RequestBody Producto p) {
        ResponseEntity<String> respuesta = null;

        if(service.save(p) != null){
            respuesta = ResponseEntity.ok("Producto creado exitosamente");
        } else {
            respuesta = ResponseEntity.internalServerError().body("Oops");
        }
        return respuesta;
    }

   /* @GetMapping("/todos")
    public ResponseEntity<List<Producto>> consultarTodos(){
        return ResponseEntity.ok(service.obtenerTodos());
    }*/

    @RequestMapping(value = "/todos", method = RequestMethod.GET, produces = "application/json")
    public List<Producto> getProduct() {
        return service.obtenerTodos();
    }

    @DeleteMapping(value = "/eliminar/{id}")
    public String deleteProduct(@PathVariable Long id) {
    return service.eliminarProducto(id);
    }

    @PutMapping(value = "/modificar")
        public String updateProduct(Producto producto){
            return service.modificarProducto(producto);
        }

}
