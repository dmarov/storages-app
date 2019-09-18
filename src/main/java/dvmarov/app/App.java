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

    @RequestMapping("/")
    String home() {
        return "Hello World!";
    }

    public static void main( String[] args ) {
        SpringApplication.run(App.class, args);
    }
}
