package com.velocity.ibe.services.roomservicehelper;

import org.springframework.stereotype.Component;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.List;
import java.util.Map;

@Component
public class Price {

    public BigDecimal calculateDisplayPrice(BigDecimal basePrice,List<Map<String, Object>> propertyOffers,List<Map<String, Object>> roomTypeOffers) {

        BigDecimal lowestPrice = basePrice;
        for (Map<String, Object> offer : propertyOffers) {
            BigDecimal discounted = applyDiscount(basePrice, (BigDecimal) offer.get("offer_percentage"));
            if (discounted.compareTo(lowestPrice) < 0) {
                lowestPrice = discounted;
            }
        }

        for (Map<String, Object> offer : roomTypeOffers) {
            BigDecimal discounted = applyDiscount(basePrice, (BigDecimal) offer.get("offer_percentage"));
            if (discounted.compareTo(lowestPrice) < 0) {
                lowestPrice = discounted;
            }
        }
        return lowestPrice;
    }

    private BigDecimal applyDiscount(BigDecimal price, BigDecimal offerPercentage) {
        BigDecimal discount = price
                .multiply(offerPercentage)
                .divide(BigDecimal.valueOf(100), 2, RoundingMode.HALF_UP);
        return price.subtract(discount);
    }
}