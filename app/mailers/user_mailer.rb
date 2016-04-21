#encoding:utf-8
class UserMailer < ActionMailer::Base
  async = true
  
  default from: "上海儿童营养中心茶<cs@iotps.com>"


  def user_email(addr,subject)
  	mail(:to => addr, :subject => subject)
  end

end
