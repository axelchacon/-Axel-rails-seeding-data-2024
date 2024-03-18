class Critic < ApplicationRecord
  belongs_to :game

  validates :title, :body, presence: { message: "can't be blank. Please write something!" }
end
