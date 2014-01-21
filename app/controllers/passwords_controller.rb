class PasswordsController < Devise::PasswordsController


  protected

  def after_sign_in_path_for(resource)
    static_pages_help_path(resource)
  end

  def after_sending_reset_password_instructions_path_for(resource)
    static_pages_help_path(resource)
  end


end
