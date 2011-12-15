class Quizes::GetStarted::BaseController < Quizes::BaseController
  before_filter :require_user

  private
  def next_question
    questionnaire       = Questionnaire.includes(:questions).order(:question => :position).find(1)
    remaining_questions = (questionnaire.active_question_ids - current_user.user_answers.map(&:question_id))
    remaining_questions.empty? ? nil : questionnaire.questions.find(remaining_questions.first)
  end
end