package dvmarov.app.configs;

import org.springframework.context.annotation.*;
import org.springframework.data.rest.webmvc.config.RepositoryRestConfigurer;
import org.springframework.data.rest.core.config.RepositoryRestConfiguration;

@Configuration
class CustomRestMvcConfiguration {

    @Bean
    public RepositoryRestConfigurer repositoryRestConfigurer() {

        return new RepositoryRestConfigurer() {

            @Override
            public void configureRepositoryRestConfiguration(RepositoryRestConfiguration config) {
                config.setBasePath("/api")
                    .setDefaultPageSize(10)
                    .setMaxPageSize(1000);
            }
        };
    }
}
