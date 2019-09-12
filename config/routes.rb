Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  scope '/trainings' do
    get 'new' => 'trainings#new', as: :trainings
    post 'new' => 'trainings#create', as: :create_training
    get '' => 'trainings#list', as: :trainings_list
    get ':training_id' => 'trainings#edit_training_menu', as: :training_editor

    scope '/:training_id' do
      get ':lesson_id' => 'lessons#lesson_info', as: :lessons
      post 'new_lesson' => 'lessons#create', as: :create_lesson
    end
  end

  root :to => 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
