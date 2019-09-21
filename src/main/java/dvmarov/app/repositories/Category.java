package dvmarov.app.repositories;

import java.util.List;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@RepositoryRestResource(collectionResourceRel = "items", path = "categories")
public interface Category extends PagingAndSortingRepository<dvmarov.app.resources.Category, Long> {

}
