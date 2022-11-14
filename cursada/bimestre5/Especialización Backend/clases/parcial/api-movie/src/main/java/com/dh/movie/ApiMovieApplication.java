package com.dh.movie;

import com.dh.movie.model.Movie;
import com.dh.movie.repository.MovieRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.context.annotation.Bean;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;


@SpringBootApplication
@EnableJpaRepositories
@EnableDiscoveryClient
public class ApiMovieApplication {

    public static void main(String[] args) {
        SpringApplication.run(ApiMovieApplication.class, args);
    }


    @Bean
    public CommandLineRunner loadData(MovieRepository repository) {
        return (args) -> {
            if (!repository.findAll().isEmpty()) {
                return;
            }

            repository.save(new Movie(null, "Pelicula 1", "Terror", "www.netflix.com"));
            repository.save(new Movie(null, "Pelicula 2", "Terror", "www.netflix.com"));
            repository.save(new Movie(null, "Pelicula 3", "Comedia", "www.netflix.com"));
            repository.save(new Movie(null, "Pelicula 4", "Ficcion", "www.netflix.com"));
        };
    }

}
