FROM tomcat:10.0

COPY ssl $CATALINA_HOME/ssl/
COPY conf/server.xml $CATALINA_HOME/conf/server.xml
COPY conf/web.xml $CATALINA_HOME/conf/web.xml
COPY conf/tomcat-users.xml $CATALINA_HOME/conf/tomcat-users.xml

# Update Server Info. STIG ID = TCAT-AS-000950
RUN jar -xf $CATALINA_HOME/lib/catalina.jar org/apache/catalina/util/ServerInfo.properties
COPY prop/ServerInfo.properties org/apache/catalina/util/ServerInfo.properties
RUN jar -uf $CATALINA_HOME/lib/catalina.jar org/apache/catalina/util/ServerInfo.properties

# Change Permission Mod. STIG ID = TCAT-AS-000360, TCAT-AS-000361, TCAT-AS-000370, TCAT-AS-000371, 
#     TCAT-AS-000380, TCAT-AS-000360, TCAT-AS-001270
RUN chmod -R 640 $CATALINA_HOME/bin/*.jar
RUN chmod 750 $CATALINA_HOME/bin/

RUN chmod -R 640 $CATALINA_HOME/conf/*.*
RUN chmod 750 $CATALINA_HOME/conf/

RUN chmod -R 640 $CATALINA_HOME/logs/
RUN chmod 750 $CATALINA_HOME/logs/

RUN chmod -R 640 $CATALINA_HOME/ssl/*.*
RUN chmod 750 $CATALINA_HOME/ssl/

RUN chmod 750 $CATALINA_HOME/temp/

# Create Tomcat User. STIG ID = TCAT-AS-001050, TCAT-AS-001060
RUN useradd tomcat
RUN usermod -s /usr/sbin/nologin tomcat

# Change Owner and Group. STIG ID = TCAT-AS-001200, TCAT-AS-001220, TCAT-AS-001250, TCAT-AS-001260, TCAT-AS-001280 
RUN chown root:tomcat $CATALINA_HOME/
RUN chown root:tomcat $CATALINA_HOME/conf/
RUN chown root:tomcat $CATALINA_HOME/logs/
RUN chown tomcat:tomcat $CATALINA_HOME/temp/
RUN chown tomcat:tomcat $CATALINA_HOME/work/

# Replace ROOT with Someting else --  Need to do!!!
# RUN rm -r $CATALINA_HOME/webapps/ROOT
# RUN rm -r $CATALINA_HOME/webapps/docs

CMD [ "catalina.sh", "run" ]