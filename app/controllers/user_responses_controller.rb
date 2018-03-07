class UserResponsesController < ApplicationController
  before_action :current_user_must_be_user_response_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_user_response_user
    user_response = UserResponse.find(params[:id])

    unless current_user == user_response.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @user_responses = UserResponse.all

    render("user_responses/index.html.erb")
  end

  def show
    @user_response = UserResponse.find(params[:id])

    render("user_responses/show.html.erb")
  end

  def new
    @user_response = UserResponse.new

    render("user_responses/new.html.erb")
  end

  def create
    @user_response = UserResponse.new

    @user_response.user_id = params[:user_id]
    @user_response.question_id = params[:question_id]
    @user_response.answer_id = params[:answer_id]

    save_status = @user_response.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/user_responses/new", "/create_user_response"
        redirect_to("/user_responses")
      else
        redirect_back(:fallback_location => "/", :notice => "User response created successfully.")
      end
    else
      render("user_responses/new.html.erb")
    end
  end

  def edit
    @user_response = UserResponse.find(params[:id])

    render("user_responses/edit.html.erb")
  end

  def update
    @user_response = UserResponse.find(params[:id])
    @user_response.question_id = params[:question_id]
    @user_response.answer_id = params[:answer_id]

    save_status = @user_response.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/user_responses/#{@user_response.id}/edit", "/update_user_response"
        redirect_to("/user_responses/#{@user_response.id}", :notice => "User response updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "User response updated successfully.")
      end
    else
      render("user_responses/edit.html.erb")
    end
  end

  def destroy
    @user_response = UserResponse.find(params[:id])

    @user_response.destroy

    if URI(request.referer).path == "/user_responses/#{@user_response.id}"
      redirect_to("/", :notice => "User response deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "User response deleted.")
    end
  end
end
