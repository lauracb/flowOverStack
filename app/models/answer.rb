class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question, dependent: :destroy
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  def answer_voted_by?(user)
    votes.exists?(user: user)
  end
end
