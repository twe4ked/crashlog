Rails.application.routes.draw do
  get 'broken' => 'welcome#broken'

  root :to => "welcome#index"
end
