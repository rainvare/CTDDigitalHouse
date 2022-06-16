package com.example.ejemplointegrador.controllers;

import com.example.ejemplointegrador.models.Odontologo;
import com.example.ejemplointegrador.models.Paciente;
import com.example.ejemplointegrador.services.OdontologoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class OdontologoController {

    @Autowired
    public OdontologoService odontologoService;

    @GetMapping("/odontologos")
    public String getAll(Model model){

        for (int i = 0; i < odontologoService.getAll().size(); i++) {
            Odontologo o = odontologoService.getAll().get(i);
            model.addAttribute("name"+i, o.getNombre());
            model.addAttribute("surname"+i, o.getApellido());
            model.addAttribute("matricula"+i, o.getMatricula());
        }

        return "todos";
    }

    @GetMapping("/id")
    public String getOdontologoByID(/*@RequestParam(name="name", required=false, defaultValue="1L")*/ /*long id,*/ Model model){
        Long id = 1L;
        Odontologo o = odontologoService.getOdontologoById(id);

        if (o == null) return "No se encontro odontologo con ese ID";

        model.addAttribute("name", o.getNombre());
        model.addAttribute("surname", o.getApellido());
        model.addAttribute("matricula", o.getMatricula());
        model.addAttribute("id", o.getId());


        return "id";
    }
}


