Rails.application.routes.draw do
  resources :pictures do
    collection do
      post :confirm
    end
  end

  resources :users,only:[:new,:create,:edit,:update,:show] do
    collection do
      post :confirm
    end
  end

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  
end
