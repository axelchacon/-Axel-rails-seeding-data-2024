class Critic < ApplicationRecord
  belongs_to :game
  belongs_to :user

  validates :title, :body, presence: { message: "can't be blank. Please write something!" }
end
