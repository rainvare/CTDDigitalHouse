package com.msbills.feign;
import feign.RequestInterceptor;
import feign.RequestTemplate;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationToken;
import org.springframework.stereotype.Component;

@Component
public class FeignInterceptor implements RequestInterceptor {

    @Override
    public void apply(RequestTemplate requestTemplate) {

        String token = getAccessToken();
        if (token != null) {
            requestTemplate.header("Authorization", "Bearer " + token);
        }

    }

    private String getAccessToken() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String token = null;
        if (authentication != null) {
            try {
                token = ((JwtAuthenticationToken) authentication).getToken().getTokenValue();
            } catch (Exception ignored) {

            }

        }
        return token;
    }
}
