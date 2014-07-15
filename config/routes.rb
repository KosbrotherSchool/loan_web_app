Rails.application.routes.draw do

  devise_for :users, controllers: { sessions: "sessions" }
  # :skip => :registrations
  # resources :users
  
  root :to => "house_loan#index"
  get "about-us" => "house_loan#about_us"
  get "index" => "house_loan#index"

  get "join-us" => "house_loan#join_us"
  get "faq" => "house_loan#faq"
  get "privacy" => "house_loan#privacy"
  get "term" => "house_loan#term"
  # get "lender_response" => "house_loan#lender_response"

  post "create_lender" => "house_loan#create_lender"

  get "backstage" => "backstage#index"
  get "apply-mortgage" => "loan_cases#apply_mortgage"
  patch "backstage/deliver_mail" => "backstage#deliver_mail"
  patch "backstage/update_evaluate_case" => "backstage#update_evaluate_case"
  patch "backstage/update_delivering_case" => "backstage#update_delivering_case"
  patch "backstage/update_loaning_case" => "backstage#update_loaning_case"
  patch "backstage/update_loanded_case" => "backstage#update_loanded_case"

  get "backstage/lenders" => "backstage#lenders"
  patch "backstage/update_lender" => "backstage#update_lender"

  resources :loan_cases do
    get "responses/lenders" => "responses#lender_response"
    resources :responses
  end

end
