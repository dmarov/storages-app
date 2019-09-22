package dvmarov.app.modules.products;

import java.util.List;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@RepositoryRestResource(collectionResourceRel = "items", path = "products")
public interface ProductsRepository extends PagingAndSortingRepository<dvmarov.app.models.Product, Long> {

}
