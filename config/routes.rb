require 'sidekiq/web'
Rails.application.routes.draw do
 
  get 'user_lenders/user_center'

  get 'user_lenders_controller/user_center'

  mount Sidekiq::Web, at: '/sidekiq'

  devise_for :user_lenders, controllers: { sessions: "sessions" }
  devise_for :users, controllers: { sessions: "sessions" }
  # :skip => :registrations
  # resources :users
  
  root :to => "house_loan#index"
  get "msg" => "house_loan#index"
  get "about-us" => "house_loan#about_us"
  get "index" => "house_loan#index"
  
  get "banks" => "banks#banks_list"
  get "banks/:bank_id" => "banks#bank_products"

  get "join-us" => "house_loan#join_us"
  post "create_lender" => "house_loan#create_lender"

  get "faq" => "house_loan#faq"
  get "privacy" => "house_loan#privacy"
  get "term" => "house_loan#term"
  
  get "apply-mortgage" => "loan_cases#apply_mortgage"
  get "apply-onlending" => "onlendings#apply_onlending"

  get "backstage/counties/:county_id" => "backstage#county_lenders"

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
  get "backstage/lenders/:lender_id" => "backstage#lender_edit"
  patch "backstage/lenders/:lender_id/update" => "backstage#update_lender"

  get "backstage/loan_cases/:loan_case_id" => "backstage#loan_case_detail"
  get "backstage/loan_cases/:loan_case_id/edit" => "backstage#loan_case_detail_edit" 
  patch "backstage/loan_cases/:loan_case_id/loan_case_update" => "backstage#loan_case_detail_update"
  patch "backstage/mail_to_lenders" => "backstage#mail_to_lenders"
  get "backstage/loan_cases/:loan_case_id/lenders/:lender_id/mail_to_the_lender" => "backstage#mail_to_the_lender"
  post "backstage/loan_cases/:loan_case_id/loan_case_update_time" => "backstage#loan_case_update_time"

  get "backstage/onlendings/:onlending_id" => "backstage#onlending_detail"
  get "backstage/onlendings/:onlending_id/edit" => "backstage#onlending_detail_edit" 
  patch "backstage/onlendings/:onlending_id/onlending_update" => "backstage#onlending_detail_update"
  patch "backstage/onlendings/:onlending_id/mail_to_lenders" => "backstage#onlending_mail_to_lenders"
  get "backstage/onlendings/:onlending_id/lenders/:lender_id/mail_to_the_lender" => "backstage#onlending_mail_to_the_lender"
  post "backstage/onlendings/:onlending_id/onlending_update_time" => "backstage#onlending_update_time"
  
  get "backstage/banks" => "backstage#banks"
  get "backstage/banks/:bank_id/bank_products/:bank_product_id" => "backstage#band_product_detail"
  get "backstage/banks/:bank_id" => "backstage#bank_products"
  get "backstage/bank_products/:bank_product_id/edit" => "backstage#bank_product_edit"
  get "backstage/bank_products/new" => "backstage#bank_product_new"
  patch "backstage/bank_products/:bank_product_id/update" => "backstage#bank_product_update"
  post "backstage/bank_products/create" => "backstage#bank_product_create"
  get "backstage/bank_products/:bank_product_id/delete" => "backstage#bank_product_delete"

  resources :loan_cases do
    get "responses/lenders" => "responses#lender_response"
    patch "responses/lenders" =>  "responses#lender_response_update"
    get "case_detail" => "loan_cases#case_detail"
    resources :responses
  end

  resources :onlendings do
    get "/response" => "onlendings#lender_response"
    patch "/response" => "onlendings#lender_response_update"
    post "/response" => "onlendings#lender_response_update"
  end

  get "user_lenders/:lender_id/user_center" => "user_lenders#user_center"
  get "user_lenders/:lender_id/user_cases" => "user_lenders#user_cases"
  get "user_lenders/:lender_id/user_edit" => "user_lenders#user_edit"
  patch "user_lenders/:lender_id/user_update" => "user_lenders#user_update"

end
