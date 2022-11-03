package com.dh.gateway.filter;

import org.springframework.cloud.gateway.filter.GatewayFilter;
import org.springframework.cloud.gateway.filter.factory.AbstractGatewayFilterFactory;
import org.springframework.stereotype.Component;
import reactor.core.publisher.Mono;

import java.util.Calendar;
import java.util.concurrent.atomic.AtomicInteger;

@Component
public class FilterCustom extends AbstractGatewayFilterFactory<FilterCustom.Config> {

    private static AtomicInteger COUNT_CALL_GATEWAY = new AtomicInteger(0);
    public FilterCustom() {
        super(FilterCustom.Config.class);
    }

    
    @Override
    public GatewayFilter apply(Config config) {

        //Filtro previo a la invocación del servicio real asociado al gateway


        return (exchange, chain) -> chain.filter(exchange).then(Mono.fromRunnable(() -> {
            //Filtro posterior a la invocación del servicio real asociado al gateway
            System.out.printf("\nCantidad de llamadas al gateway: " + COUNT_CALL_GATEWAY.incrementAndGet());

            System.out.printf("\nTime response "+ Calendar.getInstance().getTime());
        }));
    }

    public static class Config {

    }
}
