Rails.application.routes.draw do
  root 'pictures#index'
  resources :sessions,only:[:new]

  resources :pictures do
    collection do
      post :confirm
    end
  end

  resources :users,only:[:new,:create,:edit,:update,:show,:index] do
    collection do
      post :confirm
    end
  end

  resources :sessions,only:[:new,:create,:destroy]

  resources :favorites,only:[:create,:destroy,:index]

  resources :relationships,only:[:create,:destroy]

  resources :conversations do
    resources :messages
  end

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  
end
