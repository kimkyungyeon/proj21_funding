package proj21_funding.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

@Configuration
@Import({ContextDataSource.class, ContextSqlSession.class, MvcConfig.class, ContextTransaction.class})
@ComponentScan(basePackages = {	"proj21_funding.controller",
								"proj21_funding.service",
								"proj21_funding.mapper"})
public class ContextRoot {

}
