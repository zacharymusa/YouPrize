package com.youprize.ypweb.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
 
@Controller
public class FileUploadController {

    @RequestMapping("/fileUpload")
    public ModelAndView helloWorld() {
    	// TODO complete full implementation ...
        return new ModelAndView("hello", "message", "Actual message goes here ...");
    }
    
}
