class OutcomesController < ApplicationController
  def index
    @outcomes = Outcome.all

    render("outcomes/index.html.erb")
  end

  def show
    @outcome = Outcome.find(params[:id])

    render("outcomes/show.html.erb")
  end

  def new
    @outcome = Outcome.new

    render("outcomes/new.html.erb")
  end

  def create
    @outcome = Outcome.new

    @outcome.prereq_question_id = params[:prereq_question_id]
    @outcome.answer_id = params[:answer_id]
    @outcome.resulting_question_id = params[:resulting_question_id]

    save_status = @outcome.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/outcomes/new", "/create_outcome"
        redirect_to("/outcomes")
      else
        redirect_back(:fallback_location => "/", :notice => "Outcome created successfully.")
      end
    else
      render("outcomes/new.html.erb")
    end
  end

  def edit
    @outcome = Outcome.find(params[:id])

    render("outcomes/edit.html.erb")
  end

  def update
    @outcome = Outcome.find(params[:id])

    @outcome.prereq_question_id = params[:prereq_question_id]
    @outcome.answer_id = params[:answer_id]
    @outcome.resulting_question_id = params[:resulting_question_id]

    save_status = @outcome.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/outcomes/#{@outcome.id}/edit", "/update_outcome"
        redirect_to("/outcomes/#{@outcome.id}", :notice => "Outcome updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Outcome updated successfully.")
      end
    else
      render("outcomes/edit.html.erb")
    end
  end

  def destroy
    @outcome = Outcome.find(params[:id])

    @outcome.destroy

    if URI(request.referer).path == "/outcomes/#{@outcome.id}"
      redirect_to("/", :notice => "Outcome deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Outcome deleted.")
    end
  end
end
