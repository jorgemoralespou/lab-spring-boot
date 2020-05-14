FROM ubuntu:18.04

RUN apt-get update && apt-get install -y \
  build-essential \
  gettext-base \
  openjdk-8-jdk \
  unzip \
  curl

RUN cd home && \
    curl "https://start.spring.io/starter.zip?type=maven-project&language=java&bootVersion=2.2.7.RELEASE&baseDir=demo&groupId=com.example&artifactId=demo&name=demo&description=Demo%20project%20for%20Spring%20Boot&packageName=com.example.demo&packaging=jar&javaVersion=1.8&dependencies=devtools,configuration-processor,web,lombok,webflux,data-rest,data-rest-hal,hateoas,session,web-services,jersey,vaadin,thymeleaf,freemarker,mustache,groovy-templates,security,oauth2-client,oauth2-resource-server,okta,data-ldap,jdbc,data-jpa,data-jdbc,mybatis,liquibase,flyway,jooq,db2,derby,h2,hsql,sqlserver,mysql,oracle,postgresql,data-redis,data-redis-reactive,data-mongodb,data-mongodb-reactive,data-elasticsearch,data-solr,data-cassandra,data-cassandra-reactive,geode,data-couchbase,data-couchbase-reactive,data-neo4j,integration,amqp,kafka,kafka-streams,activemq,artemis,websocket,rsocket,camel,solace,batch,validation,mail,quartz,cache,actuator,codecentric-spring-boot-admin-client,codecentric-spring-boot-admin-server,datadog,influx,graphite,new-relic,prometheus,wavefront,restdocs,cloud-contract-verifier,cloud-contract-stub-runner,unboundid-ldap,flapdoodle-mongo,cloud-starter,cloud-function,cloud-task,cloud-security,cloud-oauth2,cloud-connectors,open-service-broker,cloud-config-client,cloud-config-server,cloud-starter-vault-config,cloud-starter-zookeeper-config,cloud-starter-consul-config,cloud-eureka,cloud-eureka-server,alibaba-sentinel,cloud-resilience4j,cloud-hystrix,cloud-hystrix-dashboard,cloud-turbine,cloud-turbine-stream,cloud-starter-sleuth,cloud-starter-consul-discovery,cloud-starter-zookeeper-discovery,cloud-cloudfoundry-discovery,cloud-gateway,cloud-zuul,cloud-ribbon,cloud-feign,cloud-loadbalancer,cloud-starter-zipkin,cloud-bus,cloud-stream,scs-config-client,scs-service-registry,scs-circuit-breaker,cloud-aws,cloud-aws-jdbc,cloud-aws-messaging,azure-support,azure-active-directory,azure-keyvault-secrets,azure-storage,cloud-gcp,cloud-gcp-pubsub,cloud-gcp-storage,alibaba-nacos-config,alibaba-nacos-discovery" -o "./demo.zip" && \
    unzip ./demo.zip && \
    rm demo.zip && \
    cd demo && \
    ./mvnw clean package -DskipTests

CMD /bin/bash  