package com.rental.shinhan.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rental.shinhan.dto.FaqDTO;
import com.rental.shinhan.service.FaqService;

public class FaqContoller {
    @Autowired
    FaqService fService;

    @RequestMapping("/faq/list")
    public String select(Model model) {
        List<FaqDTO> faqlist = fService.selectService();
        model.addAttribute("faqlist", faqlist);
        return "faq/list"; //jsp 파일명 정해서 넣기
    }
}