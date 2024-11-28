package com.project.esdproject.Security;

import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.security.Keys;
import com.project.esdproject.model.Admin;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import javax.crypto.SecretKey;
import java.util.Date;

@Component
public class JwtUtils {

    // If you are using a custom secret key, ensure it's at least 512 bits long.
    // This example assumes you are using the `HS512` algorithm with a secret key of sufficient length.
    @Value("${jwt.secret}")
    // This is used for injecting the secret key, which is mentioned inside the application . properties
    private String jwtSecret;

    // Method to generate JWT token
    public String generateToken(Admin admin) {
        // Generate a secure 512-bit secret key for HS512 if the jwtSecret is not sufficiently long
        SecretKey secretKey = (jwtSecret.length() >= 64) ?
                Keys.hmacShaKeyFor(jwtSecret.getBytes()) :
                Keys.secretKeyFor(SignatureAlgorithm.HS512);
        // checks whether the given key is 64 bits long or not
        //if the length of the key is more than 64 bytes length then it generates the key
        // if the length of the key is not more than 64 bytes, by default it geneates the random key
        return Jwts.builder()
                .setSubject(admin.getEmail())
                //
                .claim("role", "admin")
                .setIssuedAt(new Date())
                .setExpiration(new Date(System.currentTimeMillis() + 1800000)) // 30 minutes expiration
                .signWith(secretKey)  // Use the strong 512-bit key
                .compact();// Finalizes the JWT construction and generates the token as a compact string representation.
    }

}
