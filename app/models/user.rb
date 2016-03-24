class User < ActiveRecord::Base

  validates :user_name, presence: true, uniqueness: true

  has_many :authored_polls,
    foreign_key: :author_id,
    primary_key: :id,
    class_name: :User

  has_many :responses,
    foreign_key: :user_id,
    primary_key: :id,
    class_name: :User

  has_many :answer_choices,
    through: :responses,
    source: :answer_choice
end
