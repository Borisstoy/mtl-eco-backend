class Place < ApplicationRecord
    geocoded_by :address
    after_validation :geocode, if: ->(obj){ obj.latitude.nil? or obj.latitude.nil? }
end