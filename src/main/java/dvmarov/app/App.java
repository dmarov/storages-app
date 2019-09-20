package dvmarov.app;

import org.springframework.boot.*;
import org.springframework.boot.autoconfigure.*;
import org.springframework.web.bind.annotation.*;

/**
 * storages server
 *
 */
@RestController
@EnableAutoConfiguration
public class App 
{

    @GetMapping("/products")
    String getProducts() {
        return "Hello World!";
    }

    @PostMapping("/products")
    String appendProduct() {
        return "Hello World!";
    }

    @GetMapping("/products/{id}")
    String getProduct() {
        return "Hello World!";
    }

    @PatchMapping("/products/{id}")
    String patchProduct() {
        return "Hello World!";
    }

    @DeleteMapping("/products/{id}")
    String deleteProduct() {
        return "Hello World!";
    }

    @GetMapping("/groups")
    String getGroups() {
        return "Hello World!";
    }

    @PostMapping("/groups")
    String appendGroup() {
        return "Hello World!";
    }

    @GetMapping("/groups/{id}")
    String getGroup() {
        return "Hello World!";
    }

    @PatchMapping("/groups/{id}")
    String patchGroup() {
        return "Hello World!";
    }

    @DeleteMapping("/groups/{id}")
    String deleteGroup() {
        return "Hello World!";
    }

    public static void main( String[] args ) {
        SpringApplication.run(App.class, args);
    }
}
