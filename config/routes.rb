Rails.application.routes.draw do
  scope module: :v2, constraints: ApiVersion.new('v2') do
    resources :projects, only: :index
  end

  scope module: :v1, constraints: ApiVersion.new('v1', true) do
    resources :projects do
    resources :milestones
    end
  end

  resources :users, param: :_username
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
end
