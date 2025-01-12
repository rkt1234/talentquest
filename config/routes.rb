Rails.application.routes.draw do
  # setting the authentication routes
  namespace :auth do
    post 'signin', to: 'authentication#signin' # POST /auth/signin
    post 'signup', to: 'authentication#signup' # POST /auth/signup
  end
end
