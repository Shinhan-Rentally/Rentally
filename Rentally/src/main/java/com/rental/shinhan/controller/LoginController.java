package com.rental.shinhan.controller;

import com.rental.shinhan.dto.LoginJoinDTO;
import com.rental.shinhan.service.LoginService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.naming.AuthenticationException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/customer")
public class LoginController {

    @Autowired
    LoginService lService;

    @PostMapping("/login")
    public String login(String cust_id, String cust_pw,
                        @RequestParam(value = "rememberMe", required = false) String rememberMe, HttpSession session,
                        HttpServletResponse response, Model model) {

        // 로그인 처리
        LoginJoinDTO loginUser;
        try {
            loginUser = lService.login(cust_id, cust_pw);
            session.setAttribute("cust_id", loginUser.getCust_id());
            session.setAttribute("cust_seq", loginUser.getCust_seq());
            session.setAttribute("cust_grade", loginUser.getCust_grade());
            session.setAttribute("cart_count", loginUser.getCart_count());
            session.setAttribute("wishlist_count", loginUser.getWishlist_count());
            // "아이디 기억하기" 처리
            if (rememberMe != null) { // 체크박스가 체크된 경우
                Cookie cookie = new Cookie("rememberedCustId", loginUser.getCust_id());
                cookie.setMaxAge(60 * 60 * 24 * 30); // 30일 동안 유지
                cookie.setPath("/");
                response.addCookie(cookie);
            } else { // 체크박스가 체크되지 않은 경우 (쿠키 삭제)
                Cookie cookie = new Cookie("rememberedCustId", null);
                cookie.setMaxAge(0); // 즉시 삭제
                cookie.setPath("/");
                response.addCookie(cookie);
            }
            return "redirect:/main";
        } catch (AuthenticationException e) {
            e.printStackTrace();
            // 비밀번호 불일치 예외 처리
            return "redirect:/customer/login?error=wrongPassword"; // 비밀번호 불일치 처리
        } catch (Exception e) {
            e.printStackTrace();
            // 아이디 없음 등의 다른 예외 처리
            return "redirect:/customer/login?error=userNotFound";  // 아이디 없음 처리
        }
    }

    @GetMapping("/login")
    public String longinForm(HttpSession session, HttpServletRequest request, Model model) {

        boolean blockUser = false;

        if (session.getAttribute("blockUser") != null) {
            blockUser = Boolean.parseBoolean(session.getAttribute("blockUser").toString());

            session.removeAttribute("blockUser");
        }
        model.addAttribute("blockUser", blockUser);

        // 쿠키에서 rememberedCustId 값 읽기
        Cookie[] cookies = request.getCookies();
        String rememberedCustId = null;
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("rememberedCustId".equals(cookie.getName())) {
                    rememberedCustId = cookie.getValue();
                    break;
                }
            }
        }
        // 모델에 rememberedCustId 전달
        model.addAttribute("rememberedCustId", rememberedCustId);

        return "customer/login";
    }

    //로그아웃 기능
    @GetMapping("/logout")
    public String logout(HttpServletRequest request) {

        HttpSession session = request.getSession(false); // 세션 가져오기 (존재하면)
        if (session != null) {
            session.invalidate(); // 세션 무효화
        }

        return "redirect:/main"; // 로그인 페이지로 리다이렉션
    }
}
