Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  scope '/trainings' do
    get 'new' => 'trainings#new', as: :trainings
    get 'editor' => 'trainings#editor_menu', as: :trainings_editor_menu
    get 'editor/:training_id' => 'trainings#editor', as: :training_editor
    post 'new' => 'trainings#create', as: :create_training
  end

  root :to => 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
