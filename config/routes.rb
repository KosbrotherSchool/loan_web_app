Rails.application.routes.draw do

  root :to => "house_loan#index"
  get "about_us" => "house_loan#about_us"
  get "index" => "house_loan#index"
  get "apply_mortgage" => "house_loan#apply_mortgage"
  get "join_us" => "house_loan#join_us"
  get "faq" => "house_loan#faq"
  get "privacy" => "house_loan#privacy"
  get "term" => "house_loan#term"

  post "create_lender" => "house_loan#create_lender"
  post "create_loan_case" => "house_loan#create_loan_case"

  get "backstage" => "backstage#index"

  # resources :house_exchange_loan
  resources :house_loan
  # resources :personal_loan

end
