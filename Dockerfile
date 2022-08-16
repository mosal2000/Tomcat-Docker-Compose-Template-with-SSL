FROM tomcat:10.0

COPY ssl /usr/local/tomcat/ssl/
COPY conf/server.xml /usr/local/tomcat/conf/server.xml
COPY conf/tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml

RUN chmod -R 640 /usr/local/tomcat/bin/*.jar
RUN chmod 750 /usr/local/tomcat/bin/

RUN chmod -R 640 /usr/local/tomcat/conf/*.*
RUN chmod 750 /usr/local/tomcat/conf/

RUN chmod -R 640 /usr/local/tomcat/logs/
RUN chmod 750 /usr/local/tomcat/logs/

RUN chmod -R 640 /usr/local/tomcat/ssl/*.*
RUN chmod 750 /usr/local/tomcat/ssl/

RUN chmod 750 /usr/local/tomcat/temp/

# Replace ROOT with Someting else --  Need to do!!!
# RUN rm -r /usr/local/tomcat/webapps/ROOT
# RUN rm -r /usr/local/tomcat/webapps/docs

CMD [ "catalina.sh", "run" ]