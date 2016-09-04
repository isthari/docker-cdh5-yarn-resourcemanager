FROM isthari/cdh5-base

RUN apt-get update
RUN apt-get install -y -t jessie-cdh5 hadoop-yarn-resourcemanager hadoop-yarn-proxyserver

EXPOSE 8088 8032

ADD core-site.xml /etc/hadoop/conf/core-site.xml
ADD yarn-site.xml /etc/hadoop/conf/yarn-site.xml

CMD /etc/init.d/hadoop-yarn-resourcemanager start; tail -F /var/log/hadoop-yarn/yarn-yarn-resourcemanager-*.log
