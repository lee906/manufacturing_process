package com.u1mobis.dashboard_backend.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class StockSummaryDTO {
    private String carModel;
    private int count;
}
