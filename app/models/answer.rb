class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :votes, as: :votable, dependent: :destroy

  validates :description, presence: true
  
  def answer_voted_by?(user)
    votes.exists?(user: user)
  end
end
