package com.velocity.ibe.dto.rooms;

import lombok.AllArgsConstructor;
import lombok.Getter;
import java.util.List;
import java.util.Map;

@Getter
@AllArgsConstructor
public class RoomSearchResponse {

    private List<Map<String, Object>> rooms;
    private Map<String, Object> pagination;
    private Map<String, Object> meta; 
}
