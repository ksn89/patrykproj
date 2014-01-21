class StaticPagesController < ApplicationController
  skip_before_filter :authenticate_user!, only: :help
  before_filter :redirect_user, only: :help

  def home
  end

  def help
  end

  private
  def redirect_user
    if current_user.present?
      redirect_to projects_path
    end
  end
end
