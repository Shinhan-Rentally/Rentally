package com.rental.shinhan.util;

import com.rental.shinhan.dto.PagedDTO;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

import java.util.List;

@Component
public class Pagenation {
    public <T> PagedDTO<T> paginate(List<T> items, int page, int size) {
        int start = (page - 1) * size;
        int end = Math.min(start + size, items.size());
        List<T> pagedItems = items.subList(start, end);

        int totalPages = (int) Math.ceil((double) items.size() / size);
        return new PagedDTO<>(pagedItems, totalPages, items.size(), page);
    }

    public <T> void addPagedDataToModel(PagedDTO<T> response, String attributeName, Model model) {
        model.addAttribute(attributeName, response.getItems());
        model.addAttribute("totalPages", response.getTotalPages());
        model.addAttribute("totalItems", response.getTotalItems());
        model.addAttribute("currentPage", response.getCurrentPage());
    }
}
