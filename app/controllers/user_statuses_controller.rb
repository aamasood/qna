class UserStatusesController < ApplicationController
  def index
    @user_statuses = UserStatus.all

    render("user_statuses/index.html.erb")
  end

  def show
    @user_status = UserStatus.find(params[:id])

    render("user_statuses/show.html.erb")
  end

  def new
    @user_status = UserStatus.new

    render("user_statuses/new.html.erb")
  end

  def create
    @user_status = UserStatus.new

    @user_status.subject_id = params[:subject_id]
    @user_status.last_question_id = params[:last_question_id]
    @user_status.user_id = params[:user_id]
    @user_status.last_answer_id = params[:last_answer_id]

    save_status = @user_status.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/user_statuses/new", "/create_user_status"
        redirect_to("/user_statuses")
      else
        redirect_back(:fallback_location => "/", :notice => "User status created successfully.")
      end
    else
      render("user_statuses/new.html.erb")
    end
  end

  def edit
    @user_status = UserStatus.find(params[:id])

    render("user_statuses/edit.html.erb")
  end

  def update
    @user_status = UserStatus.find(params[:id])

    @user_status.subject_id = params[:subject_id]
    @user_status.last_question_id = params[:last_question_id]
    @user_status.user_id = params[:user_id]
    @user_status.last_answer_id = params[:last_answer_id]

    save_status = @user_status.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/user_statuses/#{@user_status.id}/edit", "/update_user_status"
        redirect_to("/user_statuses/#{@user_status.id}", :notice => "User status updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "User status updated successfully.")
      end
    else
      render("user_statuses/edit.html.erb")
    end
  end

  def destroy
    @user_status = UserStatus.find(params[:id])

    @user_status.destroy

    if URI(request.referer).path == "/user_statuses/#{@user_status.id}"
      redirect_to("/", :notice => "User status deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "User status deleted.")
    end
  end
end
