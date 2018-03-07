Rails.application.routes.draw do
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
