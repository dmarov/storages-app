package dvmarov.app.models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.OneToMany;
import javax.persistence.Column;

import java.util.List;
import javax.validation.constraints.NotEmpty;

@Entity
@Table(name = "storage_category")
public class Category {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @NotEmpty
    private String title;

    private String description;

    @OneToMany(mappedBy = "category")
    private List<Product> products;

    public long getId() {

        return id;
    }

    public String getTitle() {

        return title;
    }

    public void setTitle(String title) {

        this.title = title;
    }

    public String getDescription() {

        return description;
    }

    public void setDescription(String description) {

        this.description = description;
    }

    // public List<Product> getProducts() {

    //     return products;
    // }

    // public void setProducts(List<Product> products) {

    //     this.products = products;
    // }
}
