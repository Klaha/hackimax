class LoginController < ApplicationController

  private
  def current_user
    @_current_user ||= session[:current_user_id] &&
        User.find_by(id: session[:current_user_id])
  end

  def require_login
    current_user #seteando current user
    if @path.nil?
      @path = root_path
    end

    if @_current_user.nil?

      redirect_to @path, notice: "Debes iniciar Session para continuar"
    else
      if @_current_user.role != @role
        h = {'E'=> 'Empleado', 'C'=> 'Cliente', 'A'=> 'Administrador'}
        redirect_to root_path, notice: "Usuario no " +h[@role].to_s
      end
    end
  end

end
