class AnswerChoice < ActiveRecord::Base

  validates :question_id, :text, presence: true

  belongs_to :question,
    foreign_key: :question_id,
    primary_key: :id,
    class_name: :Question

  has_many :responses,
    foreign_key: :answer_id,
    primary_key: :id,
    class_name: :AnswerChoice

  has_many :respondents,
    through: :responses,
    source: :respondent
end
