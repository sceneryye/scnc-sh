# Load the rails application
require File.expand_path('../application', __FILE__)

ENV['JAVA_HOME'] = "/usr/bin/java"
# ENV['LD_LIBRARY_PATH'] = "#{ENV['JAVA_HOME']}/jre/lib"

# Initialize the rails application
Modengke::Application.initialize!

PIC_PATH= "/root/web/scnc-sh_files/images"

ENV["SECRET_KEY_BASE"] ='42b1ea0356757c7cbaf83b17481740d889c85c13a3f42d6b3c03893819078cbbe05c4ca3a38cced29ee17efbbd8ed918a82cd1948d8f9d15251829b6ff512d08'

