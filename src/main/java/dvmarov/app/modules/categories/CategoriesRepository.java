package dvmarov.app.modules.categories;

import java.util.List;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@RepositoryRestResource(collectionResourceRel = "items", path = "categories")
public interface CategoriesRepository extends PagingAndSortingRepository<dvmarov.app.models.Category, Long> {

}
