class Questionnaire < ActiveRecord::Base
  has_many :questions
  has_many :active_questions, :class_name => 'Question', :conditions => ['questions.active = ?', true], :order => 'questions.position ASC'
end
