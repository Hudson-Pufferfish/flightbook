# == Schema Information
#
# Table name: airports
#
#  id         :bigint           not null, primary key
#  code       :string           not null
#  name       :string           not null
#  city       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
# rubocop:disable all

class Airport < ApplicationRecord
  has_many :departing_flights, 
    class_name: :Flight, 
    foreign_key: :origin_id, 
    dependent: :destroy
  has_many :arriving_flights,
    class_name: :Flight,
    foreign_key: :destination_id,
    dependent: :destroy
end