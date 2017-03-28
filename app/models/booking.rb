class Booking < ApplicationRecord
  belongs_to :agent, class_name: "User", optional: true
  validates :customer_name, presence: true
  # def bob
  #   "wehadababyitsaboy"
  # end
  #
  # def bob=(a_value)
  #   self.destination += a_value
  # end

  # def customer_name
  #   read_attribute(:customer_name)
  # end
  #
  # def customer_name=(new_value)
  #   write_attribute(:customer_name, new_value)
  # end
end
