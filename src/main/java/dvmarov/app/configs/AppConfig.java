package dvmarov.app.modules.categories;
import org.springframework.context.annotation.*;
import org.springframework.hateoas.*;
import static org.springframework.hateoas.mvc.ControllerLinkBuilder.*;

@Configuration
public class AppConfig {

    // @Bean
    // public ResourceProcessor<Resource<dvmarov.app.models.Category>> categoriesProcessor() {

    //     return new ResourceProcessor<Resource<dvmarov.app.models.Category>>() {

    //         @Override
    //         public Resource<dvmarov.app.models.Category> process(Resource<dvmarov.app.models.Category> resource) {

    //             Link linkProducts = linkTo(methodOn(dvmarov.app.modules.products.ProductsRepository.class).findAll()).withRel("products");
    //             resource.add(linkProducts);
    //             return resource;
    //         }
    //     };
    // }
}


