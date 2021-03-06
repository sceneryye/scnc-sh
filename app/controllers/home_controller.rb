# encoding:utf-8
class HomeController < ApplicationController
  before_filter :find_user
  before_action :set_account_to_shop, only: [:index, :index1]
  # layout 'magazine'
  layout 'application'
  def index
    @title = "上海儿童营养中心"
    # @home = Home.where(:supplier_id=>nil).last
    @goods = Good.where(marketable: 'true').order('p_order ASC')
    @categories = Category.where("parent_id>0 and disabled='false'")
    if signed_in?
      redirect_to params[:return_url] if params[:return_url].present?
    end
  end

  def index1
    @title = "上海儿童营养中心"
    # @home = Home.where(:supplier_id=>nil).last
    @goods = Good.where(marketable: 'true').order('p_order ASC')
    @categories = Category.where("parent_id>0 and disabled='false'")
    if signed_in?
      redirect_to params[:return_url] if params[:return_url].present?
    end
  end

  def blank
    @return_url = params[:return_url]
    render layout: nil
  end

  def topmenu
    render layout: nil
  end

  private

  def set_account_to_shop
    if current_account && current_account.member? && params[:shop_id].present?
      current_account.update(shop_id: params[:shop_id])
    end
  end
end
