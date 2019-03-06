class Question < ApplicationRecord
  belongs_to :user
  has_many :answers, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :votes, as: :votable, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true


  def question_voted_by?(user)
    votes.exists?(user: user)
  end

  def self.buscar(query)
		where("title like ? OR description like ?", "%#{query}%", "%#{query}%") 
  end
  
end
