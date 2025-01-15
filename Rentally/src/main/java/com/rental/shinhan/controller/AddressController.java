package com.rental.shinhan.controller;

import com.rental.shinhan.dto.AddressDTO;
import com.rental.shinhan.service.AddressService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Controller
public class AddressController {

    // AddressService 넣어라
    @Autowired
    private AddressService addressService;

    // 주소 저장 요청 처리
    @RequestMapping(value = "/address/add", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> saveAddress(
            @RequestParam("postcode") String postcode,
            @RequestParam("address") String address,
            @RequestParam("detailAddress") String detailAddress,
            @RequestParam("recipName") String recipName,
            @RequestParam("recipPhone") String recipPhone,
            @RequestParam(value = "addrDefault", defaultValue = "false") boolean addrDefault,
            HttpSession session) {

        // 세션에서 cust_seq 가져오기
        Integer custSeq = (Integer) session.getAttribute("cust_seq");
        if (custSeq == null) {
            throw new RuntimeException("로그인이 필요합니다.");
        }

        // 데이터 맵핑
        Map<String, String> response = new HashMap<>();

        // 주소 개수 확인
        int addressCount = addressService.getAddressCountByCustSeq(custSeq);
        if (addressCount >= 5) {
            response.put("status", "error");
            response.put("message", "주소는 최대 5개까지만 등록할 수 있습니다.");
            return response;
        }

        // 기본 주소 설정 시, 기존 기본 주소 false로 변경
        if (addrDefault) {
            addressService.updateDefaultAddressToFalse(custSeq);
        }

        // DB에 보낼 정보 저장
        AddressDTO addressData = new AddressDTO();
        addressData.setAddr_name(recipName);
        addressData.setAddr_phone(recipPhone);
        addressData.setAddr_detail(detailAddress + "(" + postcode + ")");
        addressData.setCust_seq(custSeq);
        addressData.setAddr_default(addrDefault);
        addressData.setAddr_title(address);

        // addressDTO에 데이터 정보 저장
        addressService.saveAddress(addressData);

        response.put("status", "success");
        response.put("message", "주소가 성공적으로 저장되었습니다.");

        return response; // 저장 후 response 리턴
    }

    /// getAddress/{custSeq}
    // 계정 내 등록된 주소 조회 처리
    @GetMapping("/address/list")
    public String getAddressesByCustSeq(HttpSession session, Model model) {

        // 세션에서 cust_seq 가져오기
        Integer custSeq = (Integer) session.getAttribute("cust_seq");
        if (custSeq == null) {
            throw new RuntimeException("로그인이 필요합니다.");
        }

        List<AddressDTO> addressList = addressService.getAddressesByCustSeq(custSeq);
        model.addAttribute("addressList", addressList);

        return "address/address";// 마이 페이지 주소 목록 페이지로 리다이렉트
    }

    // 계정 내 등록된 계정 중 선택한 계정 삭제
    @PostMapping(value = "/address/delete")
    @ResponseBody
    public Map<String, String> deleteAddress(@RequestParam("addrSeq") int addrSeq, HttpSession session) {

        Map<String, String> response = new HashMap<>();
        try {
            // 세션에서 cust_seq 가져오기
            Integer custSeq = (Integer) session.getAttribute("cust_seq");
            if (custSeq == null) {
                throw new RuntimeException("로그인이 필요합니다.");
            }
            addressService.deleteAddress(addrSeq);
            response.put("status", "success");
            response.put("message", "주소가 성공적으로 삭제되었습니다.");
        } catch (Exception e) {
            response.put("status", "error");
            response.put("message", "주소 삭제 중 오류가 발생했습니다.");
        }

        return response; // 삭제 후 주소 목록 페이지로 리다이렉트
    }

    // 계정 내 등록된 계정 중 선택한 계정 수정
    @ResponseBody
    @RequestMapping(value = "/address/update", method = RequestMethod.POST)
    public Map<String, String> updateAddress(AddressDTO addressData, @RequestParam("postcode") String postcode, HttpSession session) {
        Map<String, String> response = new HashMap<>();

        try {
            // 세션에서 cust_seq 가져오기
            Integer custSeq = (Integer) session.getAttribute("cust_seq");
            if (custSeq == null) {
                throw new RuntimeException("로그인이 필요합니다.");
            }

            // 수정하려는 주소가 기본 주소로 설정되려는 경우
            if (addressData.isAddr_default()) {
                // 현재 수정 중인 주소가 이미 기본 주소라면 중복 검사 생략
                AddressDTO currentAddress = addressService.getAddressById(addressData.getAddr_seq());
                if (!currentAddress.isAddr_default() && addressService.isDefaultAddressExist(custSeq)) {
                    response.put("status", "error");
                    response.put("message", "기본 주소는 하나만 설정할 수 있습니다.");
                    return response;
                }
            }

            // 서비스 호출하여 업데이트
            addressService.updateAddress(addressData);
            response.put("status", "success");
            response.put("message", "주소 정보가 성공적으로 수정되었습니다.");
        } catch (Exception e) {
            response.put("status", "error");
            response.put("message", "주소 정보 수정 중 오류가 발생했습니다.");
        }
        // 수정 후 주소 목록 페이지로 리다이렉트
        return response;
    }

    // 기본 주소 설정
    @PostMapping("/address/setDefault")
    @ResponseBody
    public Map<String, String> setDefaultAddress(@RequestParam("addrSeq") int addrSeq, HttpSession session) {

        Map<String, String> response = new HashMap<>();
        try {
            // 세션에서 cust_seq 가져오기
            Integer custSeq = (Integer) session.getAttribute("cust_seq");
            if (custSeq == null) {
                throw new RuntimeException("로그인이 필요합니다.");
            }

            addressService.unsetDefaultAddress(custSeq);// 기본 주소를 변경하기 전에 기존 기본 주소를 해제
            addressService.setDefaultAddress(addrSeq);// 선택된 주소를 기본 주소로 설정


            response.put("status", "success");
            response.put("message", "기본 주소가 성공적으로 설정되었습니다.");
        } catch (Exception e) {
            response.put("status", "error");
            response.put("message", "기본 주소 설정 중 오류가 발생했습니다.");
        }

        return response;
    }
}
