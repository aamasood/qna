class AnswersController < ApplicationController
  def index
    @q = Answer.ransack(params[:q])
    @answers = @q.result(:distinct => true).includes(:question, :outcomes, :user_statuses, :user_responses).page(params[:page]).per(10)

    render("answers/index.html.erb")
  end

  def show
    @user_response = UserResponse.new
    @user_status = UserStatus.new
    @outcome = Outcome.new
    @answer = Answer.find(params[:id])

    render("answers/show.html.erb")
  end

  def new
    @answer = Answer.new

    render("answers/new.html.erb")
  end

  def create
    @answer = Answer.new

    @answer.response = params[:response]
    @answer.question_id = params[:question_id]

    save_status = @answer.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/answers/new", "/create_answer"
        redirect_to("/answers")
      else
        redirect_back(:fallback_location => "/", :notice => "Answer created successfully.")
      end
    else
      render("answers/new.html.erb")
    end
  end

  def edit
    @answer = Answer.find(params[:id])

    render("answers/edit.html.erb")
  end

  def update
    @answer = Answer.find(params[:id])

    @answer.response = params[:response]
    @answer.question_id = params[:question_id]

    save_status = @answer.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/answers/#{@answer.id}/edit", "/update_answer"
        redirect_to("/answers/#{@answer.id}", :notice => "Answer updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Answer updated successfully.")
      end
    else
      render("answers/edit.html.erb")
    end
  end

  def destroy
    @answer = Answer.find(params[:id])

    @answer.destroy

    if URI(request.referer).path == "/answers/#{@answer.id}"
      redirect_to("/", :notice => "Answer deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Answer deleted.")
    end
  end
end
