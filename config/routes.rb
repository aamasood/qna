Rails.application.routes.draw do
  # Routes for the Company resource:
  # CREATE
  get "/companies/new", :controller => "companies", :action => "new"
  post "/create_company", :controller => "companies", :action => "create"

  # READ
  get "/companies", :controller => "companies", :action => "index"
  get "/companies/:id", :controller => "companies", :action => "show"

  # UPDATE
  get "/companies/:id/edit", :controller => "companies", :action => "edit"
  post "/update_company/:id", :controller => "companies", :action => "update"

  # DELETE
  get "/delete_company/:id", :controller => "companies", :action => "destroy"
  #------------------------------

  # Routes for the Subject resource:
  # CREATE
  get "/subjects/new", :controller => "subjects", :action => "new"
  post "/create_subject", :controller => "subjects", :action => "create"

  # READ
  get "/subjects", :controller => "subjects", :action => "index"
  get "/subjects/:id", :controller => "subjects", :action => "show"

  # UPDATE
  get "/subjects/:id/edit", :controller => "subjects", :action => "edit"
  post "/update_subject/:id", :controller => "subjects", :action => "update"

  # DELETE
  get "/delete_subject/:id", :controller => "subjects", :action => "destroy"
  #------------------------------

  # Routes for the Answer resource:
  # CREATE
  get "/answers/new", :controller => "answers", :action => "new"
  post "/create_answer", :controller => "answers", :action => "create"

  # READ
  get "/answers", :controller => "answers", :action => "index"
  get "/answers/:id", :controller => "answers", :action => "show"

  # UPDATE
  get "/answers/:id/edit", :controller => "answers", :action => "edit"
  post "/update_answer/:id", :controller => "answers", :action => "update"

  # DELETE
  get "/delete_answer/:id", :controller => "answers", :action => "destroy"
  #------------------------------

  # Routes for the User_status resource:
  # CREATE
  get "/user_statuses/new", :controller => "user_statuses", :action => "new"
  post "/create_user_status", :controller => "user_statuses", :action => "create"

  # READ
  get "/user_statuses", :controller => "user_statuses", :action => "index"
  get "/user_statuses/:id", :controller => "user_statuses", :action => "show"

  # UPDATE
  get "/user_statuses/:id/edit", :controller => "user_statuses", :action => "edit"
  post "/update_user_status/:id", :controller => "user_statuses", :action => "update"

  # DELETE
  get "/delete_user_status/:id", :controller => "user_statuses", :action => "destroy"
  #------------------------------

  # Routes for the Outcome resource:
  # CREATE
  get "/outcomes/new", :controller => "outcomes", :action => "new"
  post "/create_outcome", :controller => "outcomes", :action => "create"

  # READ
  get "/outcomes", :controller => "outcomes", :action => "index"
  get "/outcomes/:id", :controller => "outcomes", :action => "show"

  # UPDATE
  get "/outcomes/:id/edit", :controller => "outcomes", :action => "edit"
  post "/update_outcome/:id", :controller => "outcomes", :action => "update"

  # DELETE
  get "/delete_outcome/:id", :controller => "outcomes", :action => "destroy"
  #------------------------------

  # Routes for the Question resource:
  # CREATE
  get "/questions/new", :controller => "questions", :action => "new"
  post "/create_question", :controller => "questions", :action => "create"

  # READ
  get "/questions", :controller => "questions", :action => "index"
  get "/questions/:id", :controller => "questions", :action => "show"

  # UPDATE
  get "/questions/:id/edit", :controller => "questions", :action => "edit"
  post "/update_question/:id", :controller => "questions", :action => "update"

  # DELETE
  get "/delete_question/:id", :controller => "questions", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
