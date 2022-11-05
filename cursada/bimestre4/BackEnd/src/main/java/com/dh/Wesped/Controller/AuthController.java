package com.dh.Wesped.Controller;

import com.dh.Wesped.Model.Role;
import com.dh.Wesped.Model.User;
import com.dh.Wesped.Security.Jwt.JwtProvider;
import com.dh.Wesped.Security.Payload.LoginRequest;
import com.dh.Wesped.Security.Payload.RegisterRequest;
import com.dh.Wesped.Security.Payload.LoginResponse;
import com.dh.Wesped.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("/auth")
public class AuthController {

    @Autowired
    PasswordEncoder passwordEncoder;
    @Autowired
    AuthenticationManager authenticationManager;
    @Autowired
    UserService userService;
    @Autowired
    JwtProvider jwtProvider;

    @PostMapping("/signup")
    public ResponseEntity<?> register(@Valid @RequestBody RegisterRequest registerRequest, BindingResult bindingResult) {

        if (bindingResult.hasErrors()) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Datos invalidos");
        }
        if (userService.existsUserByEmail(registerRequest.getEmail())) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Este correo ya se encuentra registrado");
        }
        User user = new User(registerRequest.getName(),
                registerRequest.getSurname(),
                registerRequest.getEmail(),
                passwordEncoder.encode(registerRequest.getPassword()),
                "");
        // Seteo el rol por defecto: USER
        Role role = new Role();
        role.setId(2);
        user.setRole(role);
        userService.newUser(user);
        return ResponseEntity.status(HttpStatus.CREATED).body("Usuario registrado exitosamente");
    }

    @PostMapping("/signin")
    public ResponseEntity<LoginResponse> login(@Valid @RequestBody LoginRequest loginRequest, BindingResult bindingResult) {
        if (bindingResult.hasErrors())
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
        Authentication authentication = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(loginRequest.getEmail(),
                        loginRequest.getPassword()));
        SecurityContextHolder.getContext().setAuthentication(authentication);
        String jwt = jwtProvider.generateToken(authentication);
        LoginResponse token = new LoginResponse(jwt);
        return new ResponseEntity<>(token, HttpStatus.OK);
    }
}