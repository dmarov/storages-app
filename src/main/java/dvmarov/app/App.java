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

    // @GetMapping("/api/products")
    // String getProducts() {
    //     return "Hello World!";
    // }

    // @PostMapping("/api/products")
    // String appendProduct() {
    //     return "Hello World!";
    // }

    // @GetMapping("/api/products/{id}")
    // String getProduct() {
    //     return "Hello World!";
    // }

    // @PatchMapping("/api/products/{id}")
    // String patchProduct() {
    //     return "Hello World!";
    // }

    // @DeleteMapping("/api/products/{id}")
    // String deleteProduct() {
    //     return "Hello World!";
    // }

    // @GetMapping("/api/groups")
    // String getGroups() {
    //     return "Hello World!";
    // }

    // @PostMapping("/api/groups")
    // String appendGroup() {
    //     return "Hello World!";
    // }

    // @GetMapping("/api/groups/{id}")
    // String getGroup() {
    //     return "Hello World!";
    // }

    // @PatchMapping("/api/groups/{id}")
    // String patchGroup() {
    //     return "Hello World!";
    // }

    // @DeleteMapping("/api/groups/{id}")
    // String deleteGroup() {
    //     return "Hello World!";
    // }

    public static void main( String[] args ) {
        SpringApplication.run(App.class, args);
    }
}
