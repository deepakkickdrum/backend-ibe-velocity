package com.velocity.ibe.services.roomservicehelper;

import org.springframework.stereotype.Component;

import java.util.*;

@Component
public class FilterSort {

    public Map<String, Object> buildMeta(List<Map<String, Object>> rawFilters, List<Map<String, Object>> rawSortOptions) {
        Map<String, Object> meta = new HashMap<>();
        meta.put("filters", groupFilters(rawFilters));
        meta.put("sort_options", rawSortOptions);
        return meta;
    }

    private List<Map<String, Object>> groupFilters(List<Map<String, Object>> rawFilters) {
        Map<Object, Map<String, Object>> grouped = new LinkedHashMap<>();

        for (Map<String, Object> row : rawFilters) {
            Object filterId = row.get("filter_id");
            grouped.computeIfAbsent(filterId, id -> {
                Map<String, Object> filter = new LinkedHashMap<>();
                filter.put("filter_id", id);
                filter.put("filter_name", row.get("filter_name"));
                filter.put("type", row.get("type"));
                filter.put("options", new ArrayList<>());
                return filter;
            });

            if (row.get("option_id") != null) {
                Map<String, Object> option = new LinkedHashMap<>();
                option.put("id", row.get("option_id"));
                option.put("name", row.get("option_name"));

                @SuppressWarnings("unchecked")
                List<Map<String, Object>> options =(List<Map<String, Object>>) grouped.get(filterId).get("options");
                options.add(option);
            }
        }

        return new ArrayList<>(grouped.values());
    }
}