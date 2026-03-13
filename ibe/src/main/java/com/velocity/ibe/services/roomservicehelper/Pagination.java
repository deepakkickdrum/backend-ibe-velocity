package com.velocity.ibe.services.roomservicehelper;

import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.Map;

@Component
public class Pagination {

    public Map<String, Object> build(int page, int limit, int offset, int fetchedCount, int totalCount) {
        Map<String, Object> pagination = new HashMap<>();
        pagination.put("page", page);
        pagination.put("limit", limit);
        pagination.put("total_count", totalCount);
        pagination.put("has_more", (offset +fetchedCount)< totalCount);
        return pagination;
    }
}