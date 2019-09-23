package dvmarov.app.configs;

import javax.annotation.PostConstruct;

import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.http.SessionCreationPolicy;

@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Override
    public void configure(AuthenticationManagerBuilder auth) throws Exception {

        auth.inMemoryAuthentication()
            .withUser("user").password("{noop}1").roles("USER")
            .and()
            .withUser("admin").password("{noop}2").roles("ADMIN");
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {

    http.httpBasic().and()
        .authorizeRequests()
        .antMatchers(HttpMethod.GET, "/api/**").hasAnyRole("USER", "ADMIN")
        .antMatchers(HttpMethod.POST, "/api/**").hasRole("ADMIN")
        .antMatchers(HttpMethod.PUT, "/api/**").hasRole("ADMIN")
        .antMatchers(HttpMethod.PATCH, "/api/**").hasRole("ADMIN")
        .antMatchers(HttpMethod.DELETE, "/api/**").hasRole("ADMIN").and()
        .csrf().disable()
        .sessionManagement()
        .sessionCreationPolicy(SessionCreationPolicy.STATELESS);
    }
}
