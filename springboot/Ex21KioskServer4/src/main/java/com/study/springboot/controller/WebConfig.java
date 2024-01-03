package com.study.springboot.controller;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;

@Configuration
public class WebConfig extends WebMvcConfigurationSupport {

    // static폴더를 외부에서 접근하도록 열어준다.
    // 이 파일이 없으면 Web에 static파일에 존재하는 것들이 전부 보여지지 X
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/**")
                .addResourceLocations("file:src/main/resources/templates/", "file:src/main/resources/static/");
    }
}