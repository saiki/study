package "java-1.7.0-openjdk-devel" do
  action :install
end

package "git" do
	action :install
end

package "unzip" do
	action :install
end

user "add jboss user" do
	action :create
	username "jboss"
#	password "jboss"
	home "/home/jboss"
end

execute "chmod /opt" do
	command "chmod o+x /opt"
	user "root"
end

directory "create jboss directory" do
	action :create
	user "jboss"
	group "jboss"
	path "/home/jboss"
	not_if "test -e /home/jboss"
end

directory "create bin directory" do
	action :create
	user "jboss"
	group "jboss"
	path "/home/jboss/bin"
	not_if "test -e /home/jboss/bin"
end

directory "create log directory" do
	action :create
	user "jboss"
	group "jboss"
	path "/home/jboss/log"
	not_if "test -e /home/jboss/log"
end

execute "download wildfly" do
	command "wget http://download.jboss.org/wildfly/8.2.0.Final/wildfly-8.2.0.Final.zip"
	cwd "/opt"
	not_if "test -e /opt/wildfly-8.2.0.Final.zip"
end

execute "extract wildfly" do
	command "unzip wildfly-8.2.0.Final.zip"
	cwd "/opt"
	not_if "test -e /opt/wildfly-8.2.0.Final"
	only_if "test -e /opt/wildfly-8.2.0.Final.zip"
	user "jboss"
end

execute "download kie workbench" do
	command "wget http://central.maven.org/maven2/org/kie/kie-drools-wb-distribution-wars/6.1.0.Final/kie-drools-wb-distribution-wars-6.1.0.Final-wildfly.war"
	cwd "/opt"
	not_if "test -e /opt/kie-drools-wb-distribution-wars-6.1.0.Final-wildfly.war"
end

#execute "extract kie workbench" do
#	command "unzip kie-drools-wb-distribution-6.2.0.CR4.zip -d kie-workbench"
#	cwd "/opt"
#	not_if "test -e /opt/kie-workbench"
#	user "jboss"
#end

#execute "start wildfly" do
#	command "/opt/wildfly-8.2.0.Final/bin/standalone.sh"
#	user "jboss"
#end
#
#execute "deploy workbench" do
#
#end

file "copy startup.sh" do
	path "/home/jboss/bin/startup.sh"
	content_file "/vagrant/startup.sh"
	not_if "test -e /home/jboss/bin/startup.sh"
	only_if "test -e /vagrant/startup.sh"
	owner "jboss"
	group "jboss"
end

file "copy shutdown.sh" do
	path "/home/jboss/bin/shutdown.sh"
	content_file "/vagrant/shutdown.sh"
	not_if "test -e /home/jboss/bin/shutdown.sh"
	only_if "test -e /vagrant/shutdown.sh"
	owner "jboss"
	group "jboss"
end
