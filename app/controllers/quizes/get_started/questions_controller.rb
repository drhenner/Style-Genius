class Quizes::GetStarted::QuestionsController < Quizes::GetStarted::BaseController
  def index
    #params[:page] ||= 1
    #params[:rows] ||= 20
    #@questions = Question.paginate(:page => params[:page].to_i, :per_page => params[:rows].to_i)
  end

  def show
    @question = next_question
    redirect_to complete_quizes_get_started_question_url(:done) unless @question
  end

  def new
    @question = Question.new
    form_info
  end

  def create
    current_user.add_answers([params[:answer_id].to_i])
      respond_to do |format|
        if current_user.add_answers([params[:answer_id]])
          format.json { render :json => :ok, :status => 206}
        else
          format.json { render :json => current_user.errors.to_json()}
        end
      end
  end

  def edit
    @question = Question.find(params[:id])
    form_info
  end

  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(params[:question])
      redirect_to [:quizes, :get_started, @question], :notice  => "Successfully updated question."
    else
      form_info
      render :edit
    end
  end

  def complete

  end

  private
    def form_info

    end
end
