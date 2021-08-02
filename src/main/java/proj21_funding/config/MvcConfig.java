package proj21_funding.config;

import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import proj21_funding.interceptor.AuthCheckInterceptor;



@Configuration
@EnableWebMvc
public class MvcConfig implements WebMvcConfigurer {

	/** DispatcherServlet의 매핑경로를 '/'주었을 때, JSP/HTML/CSS 등을 올바르게 처리하기 위한 설정 추가 */
	@Override
	public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
		configurer.enable();
	}

	/** JSP를 통해서 컨트롤러의 실행 결과를 보여주기 위한 설정 */
	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		registry.jsp("/WEB-INF/view/", ".jsp");
	}	

	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		registry.addViewController("/main").setViewName("main");
		registry.addViewController("/practice").setViewName("practice");
	}
	
	@Bean
	public MessageSource messageSource() {
		ResourceBundleMessageSource ms = new ResourceBundleMessageSource();
		ms.addBasenames("message.label");
		ms.setDefaultEncoding("UTF-8");
		return ms;
	}
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(authCheckInterceptor()).addPathPatterns("/account/user**");
		registry.addInterceptor(authCheckInterceptor()).addPathPatterns("/message/**");
		registry.addInterceptor(authCheckInterceptor()).addPathPatterns("/qnauserview");
		registry.addInterceptor(authCheckInterceptor()).addPathPatterns("/qnawrite");
	}

	@Bean
	public AuthCheckInterceptor authCheckInterceptor() {
		return new AuthCheckInterceptor();
	}
}
