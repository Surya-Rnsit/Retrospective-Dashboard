# frozen_string_literal: true

##
# This class represents the model of Sprint.
# The name attribute should be present and unique.
class Sprint < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :actionitems, dependent: :destroy
  has_many :improvements, dependent: :destroy
  has_many :what_went_wells, dependent: :destroy
  has_many :what_went_wrongs, dependent: :destroy
end
