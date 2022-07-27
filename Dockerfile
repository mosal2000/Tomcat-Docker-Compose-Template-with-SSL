FROM tomcat:10.0

COPY ssl /usr/local/tomcat/ssl/
COPY conf/server.xml /usr/local/tomcat/conf/server.xml
COPY conf/tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml

CMD [ "catalina.sh", "run" ]