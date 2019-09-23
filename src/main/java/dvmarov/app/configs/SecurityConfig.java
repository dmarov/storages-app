package dvmarov.app.configs;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.config.http.SessionCreationPolicy;

import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;

// @Configuration
// @EnableWebSecurity
// public class SecurityConfig extends WebSecurityConfigurerAdapter {

//     @Override
//     protected void configure(HttpSecurity http) throws Exception {

//         http.authorizeRequests()
//                 .antMatchers("/api/**").permitAll()
//                 .anyRequest().authenticated()
//                 .and()
//         .formLogin()
//                 .loginPage("/login")
//                 .permitAll()
//                 .and()
//             .logout()
//                 .permitAll();
//     }

//     @Bean
//     @Override
//     public UserDetailsService userDetailsService() {
//         UserDetails user =
//              User.withDefaultPasswordEncoder()
//                 .username("user")
//                 .password("password")
//                 .roles("USER")
//                 .build();

//         return new InMemoryUserDetailsManager(user);
//     }
//     // @Autowired
//     // private DataSource dataSource;

//     // @Autowired
//     // public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {

//     //     // auth.jdbcAuthentication()
//     //     //     .dataSource(dataSource)
//     //     //     // .usersByUsernameQuery("select username, password, enabled from user where username=?")
//     //     //     // .authoritiesByUsernameQuery("select username, role from user_role where username=?")
//     //   // // .withUser(User.withUsername("user")
//     //     // // .password(passwordEncoder().encode("pass"))
//     //     // // .roles("USER"));
//     //     //     .passwordEncoder(passwordEncoder())
//     //     //     .usersByUsernameQuery("select username, password, enabled from user where username=?")
//     //     //     .authoritiesByUsernameQuery("select username, role from user_role where username=?");
//     // }

//     // @Override
//     // protected void configure(HttpSecurity http) throws Exception {

//     //     // http.authorizeRequests()
//     //     //     .anyRequest()
//     //     //     .authenticated()
//     //     //     .and()
//     //     //     .httpBasic();

//     //     // http.sessionManagement()
//     //     //     .sessionCreationPolicy(SessionCreationPolicy.STATELESS);
//     // }

//     // @Bean
//     // public PasswordEncoder passwordEncoder() {

//     //     return new BCryptPasswordEncoder(10);
//     // }
// }


import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Override
    public void configure(AuthenticationManagerBuilder auth) throws Exception {

      auth.inMemoryAuthentication()
        .withUser("user").password("{noop}1").roles("USER")
        .and()
        .withUser("admin").password("{noop}2ssss").roles("ADMIN");
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {

        http.httpBasic()
            .and()
            .authorizeRequests()
            .antMatchers("/api/**").hasRole("ADMIN");
            // .csrf().disable();
    }
}
