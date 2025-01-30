Rails.application.routes.draw do
  # setting the authentication routes
  namespace :auth do
    post 'signin', to: 'authentication#signin' # POST /auth/signin
    post 'signup', to: 'authentication#signup' # POST /auth/signup
  end

  namespace :user do
    get 'home/', to: 'user#home'
    get 'home/my_results', to: 'user#my_results'
    get 'home/test/:id', to: 'user#fetch_test_sections'
  end
end
