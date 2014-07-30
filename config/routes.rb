require 'sidekiq/web'
Rails.application.routes.draw do
  mount Sidekiq::Web, at: '/sidekiq'

  devise_for :users, controllers: { sessions: "sessions" }
  # :skip => :registrations
  # resources :users
  
  root :to => "house_loan#index"
  get "about-us" => "house_loan#about_us"
  get "index" => "house_loan#index"

  get "join-us" => "house_loan#join_us"
  post "create_lender" => "house_loan#create_lender"

  get "faq" => "house_loan#faq"
  get "privacy" => "house_loan#privacy"
  get "term" => "house_loan#term"
  
  get "apply-mortgage" => "loan_cases#apply_mortgage"
  get "apply-onlending" => "onlendings#apply_onlending"

  get "backstage" => "backstage#index"
  patch "backstage/deliver_mail" => "backstage#deliver_mail"
  patch "backstage/update_evaluate_case" => "backstage#update_evaluate_case"
  patch "backstage/update_delivering_case" => "backstage#update_delivering_case"
  patch "backstage/update_loaning_case" => "backstage#update_loaning_case"
  patch "backstage/update_loanded_case" => "backstage#update_loanded_case"
  patch "backstage/update_failed_case" => "backstage#update_failed_case"

  get "backstage/onlendings" => "backstage#onlendings"
  patch "backstage/deliver_onlending_mail" => "backstage#deliver_onlending_mail"
  patch "backstage/update_evaluate_onlending" => "backstage#update_evaluate_onlending"
  patch "backstage/update_delivering_onlending" => "backstage#update_delivering_onlending"
  patch "backstage/update_loaning_onlending" => "backstage#update_loaning_onlending"
  patch "backstage/update_loanded_onlending" => "backstage#update_loanded_onlending"
  patch "backstage/update_failed_onlending" => "backstage#update_failed_onlending"

  get "backstage/lenders" => "backstage#lenders" 
  patch "backstage/update_lender" => "backstage#lenders_update_lender"
  get "backstage/loan_cases/:loan_case_id" => "backstage#loan_case_detail"
  get "backstage/loan_cases/:loan_case_id/edit" => "backstage#loan_case_detail_edit"
  get "backstage/loan_cases/:loan_case_id/lenders/:lender_id/mail_to_the_lender" => "backstage#mail_to_the_lender"
  patch "backstage/loan_cases/:loan_case_id/loan_case_update" => "backstage#loan_case_detail_update"
  get "backstage/counties/:county_id" => "backstage#county_lenders"
  patch "backstage/mail_to_lenders" => "backstage#mail_to_lenders"
  get "backstage/lenders/:lender_id" => "backstage#lender_edit"
  patch "backstage/lenders/:lender_id/update" => "backstage#update_lender"

  resources :loan_cases do
    get "responses/lenders" => "responses#lender_response"
    patch "responses/lenders" =>  "responses#lender_response_update"
    resources :responses
  end

  resources :onlendings do
    get "/response" => "onlending#response"
    patch "/response" => "onlending#response_update"
  end

end
