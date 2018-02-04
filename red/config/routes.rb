Rails.application.routes.draw do
  resources :products
  # lo que pasa cuando se hace una peticion a facebook
  # 1-mandar una peticion a facebook
  # 2-facebook retorna a nuestra app callback_url
  # 3-procesar la info de facebook
  # 4-auttenticar a un usuario ocrear una nuevo usuario
  
  #una manera de acerlo
  #devise_for :users, :controllers => {
  #  :omniauth_callbacks => "users/omniauth_callbacks"
  #}

  #otra parecida
  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  # hay rutas de GET, POST, ROOT, este ultimo apunta a la raiz osea la uri por default
  # con el gato o numeral le digo que use el metodo o accion home	
  root 'main#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end