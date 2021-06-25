# frozen_string_literal: true

class WhatWentWell < ApplicationRecord
  validates :body, presence: true, length: { minimum: 5 }
  belongs_to :sprint
end
