class QrcodesController < ApplicationController
  def index
    @shops = Shop.all
    render layout: 'application'
  end

  def show
  end
end
