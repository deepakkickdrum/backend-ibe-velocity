package com.velocity.ibe.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.GetMapping;


@RestController
@RequestMapping("/home")
public class TestController {
    @GetMapping
    public String getHome() {
        System.out.println("called");
        return "hello this is backend";
    }
    
}
