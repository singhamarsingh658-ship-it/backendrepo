package com.genie.quiz.config;

//import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**")
                .allowedOrigins(
                       /* "http://localhost:63342",   // IntelliJ internal server
                        "http://127.0.0.1:5500",   // Live Server (optional)
                        "http://localhost:5500"*/
                        "*" //allow all origine(mobile,destop,browser)
                )
                .allowedMethods("GET", "POST", "PUT", "DELETE", "OPTIONS")
                .allowedHeaders("*")
                //.allowCredentials(true);
                .allowCredentials(false);

    }



}
