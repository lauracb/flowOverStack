class Question < ApplicationRecord
  belongs_to :user
  has_many :answers, dependent: :destroy
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  def question_voted_by?(user)
    votes.exists?(user: user)
  end
end
