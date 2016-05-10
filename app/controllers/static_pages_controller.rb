class StaticPagesController < ApplicationController
  before_action :admin_user, only: :admin_panel

  include StaticPagesHelper

  def admin_panel
  end

  def db_manage
  end

  def help
  end

  def archive
  end

end