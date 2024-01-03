package com.study.springboot;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;

@Configuration
public class WebConfig extends WebMvcConfigurationSupport {

  // static폴더를 외부에서 접근하도록 열어준다.
  @Override
  public void addResourceHandlers(ResourceHandlerRegistry registry) {
    registry.addResourceHandler("/**")
        .addResourceLocations("file:src/main/resources/templates/",
            "file:src/main/resources/static/");

//    registry.addResourceHandler("/**")
//        .addResourceLocations("classpath:/static/");
  }
}
