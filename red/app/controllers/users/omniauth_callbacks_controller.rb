# Users:: => con eso le decimos que dentro del modulo users me busque el controlador omniauth_callback_controller.rb
class Users::OmniauthCallbacksController < ApplicationController
	def facebook
		# .to_yaml => nos muestra lo que trae
		#raise request.env["omniauth.auth"].to_yaml
		@user = User.from_omniauth(request.env["omniauth_auth"])
		if @user.persisted?
			#si el usuario cierra su navegador esto evitara que vuelva a loguearse si antes ya lo hizo
			@user.remember_me = true
			#redirigimos al usuario autenticado
			sign_in_and_redirect @user, event: :autentication			
		end
	end
end