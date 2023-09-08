package com.indi.member.controller;

import com.indi.member.dto.MemberDTO;
import com.indi.member.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class MemberController {
    @Autowired
    private MemberService memberService;

    @GetMapping("/save")
    public String memberSave(Model model){
        model.addAttribute("pageName", "memberSave.jsp");
        return "index";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute MemberDTO memberDTO, Model model){
        memberService.save(memberDTO);
        model.addAttribute("pageName", "main.jsp");
        return "index";
    }

    @PostMapping("/duplicate-check")
    public ResponseEntity duplicateCheck(@RequestParam("memberEmail") String memberEmail){
        MemberDTO memberDTO = memberService.findByEmail(memberEmail);
        if (memberDTO==null){
            return new ResponseEntity<>(1, HttpStatus.OK);
        }else {
            return new ResponseEntity<>(0, HttpStatus.CONFLICT);
        }
    }

    @GetMapping("/login")
    public String login(Model model){
        model.addAttribute("pageName", "login.jsp");
        return "index";
    }
}
