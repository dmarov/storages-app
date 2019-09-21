package dvmarov.app.controllers;

import org.springframework.boot.*;
import org.springframework.boot.autoconfigure.*;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/products")
public class Products
{

    @GetMapping("/")
    String getProducts() {
        return "Hello World!";
    }

    @PostMapping("/")
    String appendProduct() {
        return "Hello World!";
    }

    @GetMapping("/{id}")
    String getProduct() {
        return "Hello World!";
    }

    @PatchMapping("/{id}")
    String patchProduct() {
        return "Hello World!";
    }

    @DeleteMapping("/{id}")
    String deleteProduct() {
        return "Hello World!";
    }
}
