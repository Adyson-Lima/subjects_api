class Subject < ApplicationRecord
  validates :name, :detail, presence: true
end
