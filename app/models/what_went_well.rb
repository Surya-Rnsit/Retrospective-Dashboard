class WhatWentWell < ApplicationRecord
    validates :body, presence: true, length: { minimum: 5 }
end
