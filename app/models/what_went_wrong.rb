# frozen_string_literal: true

##
# This class represents the model of WhatWentWrong
class WhatWentWrong < ApplicationRecord
  validates :body, presence: true, length: { minimum: 5 }
  belongs_to :sprint
end
