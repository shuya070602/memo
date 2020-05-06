class ApplicationController < ActionController::Base
  #デバイス機能実行前にconfigure_permitted_parametersの実行をする。
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  #sign_upの際にnameのデータ操作を許。追加したカラム。
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
  end

end
