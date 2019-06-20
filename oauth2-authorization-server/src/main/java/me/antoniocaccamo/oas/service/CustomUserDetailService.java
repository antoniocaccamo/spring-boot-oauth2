package me.antoniocaccamo.oas.service;


import lombok.extern.slf4j.Slf4j;
import me.antoniocaccamo.oas.domain.Credentials;
import me.antoniocaccamo.oas.repository.CredentialRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Slf4j
public class CustomUserDetailService implements UserDetailsService {

    @Autowired
    private CredentialRepository credentialRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Credentials credentials = credentialRepository.findByName(username);

        if(credentials==null){

            throw new UsernameNotFoundException("User"+username+"can not be found");
        }
        log.info("credentials : {}", credentials);

        User user = new User(credentials.getName(),credentials.getPassword(),credentials.isEnabled(),true,true,true,credentials.getAuthorities());

        return  user;

    }
}
