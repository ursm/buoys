Rails.application.routes.draw do
  get 'about'         => 'dummy/dummy', as: :about
  get 'about/history' => 'dummy/dummy', as: :history
end
