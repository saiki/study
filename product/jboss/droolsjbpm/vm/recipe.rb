package "java-1.7.0-openjdk-devel" do
  action :install
end

package "unzip" do
	action :install
end

group "add jboss group" do
	action :create
	groupname "jboss"
end

user "add jboss user" do
	action :create
	username "jboss"
	home "/home/jboss"
end

execute "chmod /opt" do
	command "chmod o+x /opt"
	user root
end

directory "create jboss directory"
	action :create
	user "jboss"
	group "jboss"
	path "/home/jboss"
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
	user "jboss"
end

execute "download kie workbench" do
	command "wget http://download.jboss.org/drools/release/6.1.0.Final/kie-drools-wb-distribution-6.1.0.Final.zip"
	cwd "/opt"
	not_if "test -e /opt/kie-drools-wb-distribution-6.1.0.Final.zip"
end

execute "extract kie workbench" do
	command "unzip kie-drools-wb-distribution-6.1.0.Final.zip"
	cwd "/opt"
	not_if "test -e /opt/kie-drools-wb-distribution-6.1.0.Final"
	user "jboss"
end

