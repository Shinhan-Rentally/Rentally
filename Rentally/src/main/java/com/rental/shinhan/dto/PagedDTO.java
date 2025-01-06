package com.rental.shinhan.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Data
@Getter @Setter
@AllArgsConstructor
public class PagedDTO<T> {
    private List<T> items;
    private int totalPages;
    private long totalItems;
    private int currentPage;
}