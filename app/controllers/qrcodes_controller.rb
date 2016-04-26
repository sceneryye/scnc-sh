class QrcodesController < ApplicationController
  # before_action :authorize_admin!, only: [:index]
  def index
    @shops = Shop.all
    render layout: 'application'
  end

  def show
  end
end
