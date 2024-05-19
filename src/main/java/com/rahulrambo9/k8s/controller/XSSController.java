package com.rahulrambo9.k8s.controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class XSSController {

    @GetMapping("/xss")
    public String xss(@RequestParam String input) {
        return "<html><body>Input: " + input + "</body></html>";
    }
}