package com.example.springcicd.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.core.env.Environment;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Arrays;
import java.util.Set;

@RequiredArgsConstructor
@RestController
public class HomeController {
    private final Environment env;
    private final Set<String> envSet = Set.of("real1", "real2");

    @GetMapping("/health")
    public void healthCheck() {
    }

    @GetMapping("/profile")
    public String profile() {
        String defaultEnv = "default";
        
        return Arrays.stream(env.getActiveProfiles())
                .filter(envSet::contains)
                .findAny()
                .orElse(defaultEnv);
    }
}
