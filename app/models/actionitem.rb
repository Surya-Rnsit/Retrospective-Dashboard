# frozen_string_literal: true

##
# This class represents the model of Actionitem
class Actionitem < ApplicationRecord
  validates :body, presence: true, length: { minimum: 5 }
  belongs_to :sprint
end
