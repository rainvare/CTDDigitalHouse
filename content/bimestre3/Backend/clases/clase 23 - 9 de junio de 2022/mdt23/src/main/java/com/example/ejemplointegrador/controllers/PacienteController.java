package com.example.ejemplointegrador.controllers;

import com.example.ejemplointegrador.models.Paciente;
import com.example.ejemplointegrador.services.PacienteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class PacienteController {

    @Autowired
    public PacienteService pacienteService;

    @GetMapping("/todos")
    public String getAll(Model model){

        for (int i = 0; i < pacienteService.getAll().size(); i++) {
            Paciente p = pacienteService.getAll().get(i);
            model.addAttribute("name"+i, p.getNombre());
            model.addAttribute("surname"+i, p.getApellido());
            model.addAttribute("matricula"+i, p.getOdontologo().getMatricula());
        }

        return "todos";
    }

    @GetMapping("/email")
    public String getPacientByEmail(@RequestParam(name="name", required=false, defaultValue="mail@mail.com") String email, Model model){
        Paciente paciente= pacienteService.getPacientByEmail(email);

        if(paciente == null) return "no se encontro paciente con ese email";

        model.addAttribute("name", paciente.getNombre());
        model.addAttribute("surname", paciente.getApellido());
        model.addAttribute("matricula", paciente.getOdontologo().getMatricula());

        return "email";
    }
}
