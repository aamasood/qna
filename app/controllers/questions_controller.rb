class QuestionsController < ApplicationController
  def index
    @questions = Question.all

    render("questions/index.html.erb")
  end

  def show
    @user_response = UserResponse.new
    @answer = Answer.new
    @outcome = Outcome.new
    @question = Question.find(params[:id])

    render("questions/show.html.erb")
  end

  def new
    @question = Question.new

    render("questions/new.html.erb")
  end

  def create
    @question = Question.new

    @question.inquiry = params[:inquiry]
    @question.subject_id = params[:subject_id]
    @question.high_level_question = params[:high_level_question]

    save_status = @question.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/questions/new", "/create_question"
        redirect_to("/questions")
      else
        redirect_back(:fallback_location => "/", :notice => "Question created successfully.")
      end
    else
      render("questions/new.html.erb")
    end
  end

  def edit
    @question = Question.find(params[:id])

    render("questions/edit.html.erb")
  end

  def update
    @question = Question.find(params[:id])

    @question.inquiry = params[:inquiry]
    @question.subject_id = params[:subject_id]
    @question.high_level_question = params[:high_level_question]

    save_status = @question.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/questions/#{@question.id}/edit", "/update_question"
        redirect_to("/questions/#{@question.id}", :notice => "Question updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Question updated successfully.")
      end
    else
      render("questions/edit.html.erb")
    end
  end

  def destroy
    @question = Question.find(params[:id])

    @question.destroy

    if URI(request.referer).path == "/questions/#{@question.id}"
      redirect_to("/", :notice => "Question deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Question deleted.")
    end
  end
end
