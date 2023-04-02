class Lecture < ApplicationRecord
  belongs_to :category, class_name: 'Category'
end
