package com.rahulrambo9.k8s.controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@RestController
public class IDORController {

    private static final Map<String, String> data = new HashMap<>();

    static {
        data.put("1", "Sensitive Data 1");
        data.put("2", "Sensitive Data 2");
    }

    @GetMapping("/idor")
    public String idor(@RequestParam String id) {
        return data.get(id);
    }
}
