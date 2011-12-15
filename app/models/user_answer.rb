class UserAnswer < ActiveRecord::Base

  belongs_to :user
  belongs_to :answer
  belongs_to :question

  before_save :set_question_id

  private

  def set_question_id
    self.question_id ||= answer.question_id
  end
end
