package com.devinlee.mavendocker;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class MavenDockerApplication {

    public static void main(String[] args) {
        SpringApplication.run(MavenDockerApplication.class, args);
    }

    @GetMapping("/test/{name}")
    public String test(@PathVariable(name = "name") String name) {

        return "牛逼啊~" + name;
    }
}
