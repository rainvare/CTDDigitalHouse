package com.dh.Wesped.Security.Jwt;

import com.dh.Wesped.Security.AppUser;
import io.jsonwebtoken.*;
import io.jsonwebtoken.security.Keys;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Component;

import javax.crypto.SecretKey;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Component
public class JwtProvider {

    private static final Logger logger = Logger.getLogger(JwtProvider.class);
    private SecretKey key = Keys.secretKeyFor(SignatureAlgorithm.HS256);
    @Value("${jwt.expiration}")
    private int expiration;

    public String generateToken(Authentication authentication) {
        Map<String, Object> claims = new HashMap<>();
        AppUser appUser = (AppUser) authentication.getPrincipal();
        claims.put("user_info",appUser);
        return Jwts.builder()
                .setSubject(appUser.getUsername())
                .addClaims(claims)
                .setIssuedAt(new Date())
                .setExpiration(new Date(new Date().getTime() + expiration * 1000))
                .signWith(key)
                .compact();
        //TODO: Mejorar la firma del token
    }

    public String getEmailFromToken(String token) {
        return Jwts.parser().setSigningKey(key).parseClaimsJws(token).getBody().getSubject();
    }

    public Boolean validateToken(String token) {
        try {
            Jwts.parser().setSigningKey(key).parseClaimsJws(token);
            return true;
        } catch (MalformedJwtException e) {
            logger.error("Token mal formado");
        } catch (UnsupportedJwtException e) {
            logger.error("Token no soportado");
        } catch (ExpiredJwtException e) {
            logger.error("Token expirado");
        } catch (IllegalArgumentException e) {
            logger.error("Token vacio");
        } catch (SignatureException e) {
            logger.error("Fallo con la firma");
        }
        return false;
    }
}