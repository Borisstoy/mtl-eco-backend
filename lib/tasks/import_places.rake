namespace :import_places do
    desc "Import JSON places"
    
    task run: :environment do
        require "#{Rails.root}/app/helpers/to_slug"
        include ApplicationHelper

        places = JSON.parse(File.read("./lib/tasks/places.json"))
        
        puts "Deleting places"
        Place.destroy_all
        ActiveRecord::Base.connection.reset_pk_sequence!('places')
        
        puts "JSON parsing starting..."

        places.each do |place|
            puts "Creating: #{place['store_name']}"
     
            Place.create!(
                name: place['store_name'],
                address: place['address'],
                latitude: place['_geoloc']['lat'],
                longitude: place['_geoloc']['lng'],
                slug: ApplicationHelper.to_slug(place['store_name']),
                phone: place['phone'],
                kind: place['category']['key']
            )
        end

        puts "JSON parsing done !"

    end
end
