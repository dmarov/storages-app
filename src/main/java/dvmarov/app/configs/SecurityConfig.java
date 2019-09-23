package dvmarov.app.configs;

import javax.annotation.PostConstruct;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.context.annotation.Bean;

@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    DataSource dataSource;

    @Autowired
    public void configAuthentication(AuthenticationManagerBuilder auth) throws Exception {

        auth.jdbcAuthentication().dataSource(dataSource)
            .usersByUsernameQuery("select \"username\", \"password\", \"enabled\" from \"user\" where username=?")
            .authoritiesByUsernameQuery("select \"username\", \"role\" from \"user_role\" where username=?");
    }

    // @Override
    // public void configure(AuthenticationManagerBuilder auth) throws Exception {

    //     auth.inMemoryAuthentication()
    //         .passwordEncoder(passwordEncoder())
    //         .withUser("user").password("$2a$10$N8hMO.ANJw9270DVWWimcOiiO1RxFIThEcewLsakH.I7BxMOtLUKO").roles("USER")
    //         .and()
    //         .withUser("admin").password("$2a$10$jkvJAwejmBIqY/5lnHdonOo1Qjeog7ZHQq3heornXcV8xIwtSsG5K").roles("ADMIN");
    // }

    @Override
    protected void configure(HttpSecurity http) throws Exception {

    http.httpBasic()
        .and()
        .authorizeRequests()
        .antMatchers(HttpMethod.GET, "/api/**").hasAnyRole("USER", "ADMIN")
        .antMatchers(HttpMethod.POST, "/api/**").hasRole("ADMIN")
        .antMatchers(HttpMethod.PUT, "/api/**").hasRole("ADMIN")
        .antMatchers(HttpMethod.PATCH, "/api/**").hasRole("ADMIN")
        .antMatchers(HttpMethod.DELETE, "/api/**").hasRole("ADMIN")
        .and()
        .csrf().disable()
        .sessionManagement()
        .sessionCreationPolicy(SessionCreationPolicy.STATELESS);
    }

    @Bean
    public PasswordEncoder passwordEncoder() {

        return new BCryptPasswordEncoder();
    }
}
