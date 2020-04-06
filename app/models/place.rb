class Place < ApplicationRecord
    geocoded_by :address
    after_validation :geocode, if: ->(obj){ obj.latitude.nil? or obj.latitude.nil? }

    scope :search_by_kind, -> (kind) { where kind: kind }
    scope :places_kinds, -> { Place.all.map { |p| p.kind }.uniq }
end