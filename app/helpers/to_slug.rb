require "i18n"

module ApplicationHelper
    def to_slug(str)
        slug = str.strip.downcase
        slug.gsub! /['`]/,""
        slug.gsub! /\s*@\s*/, " at "
        slug.gsub! /\s*&\s*/, " and "
        slug.gsub! /\ +/, '-'
        slug = I18n.transliterate(slug) # replace accent letters
        slug.gsub! /_+/,"_"
        slug.gsub! /\A[_\.]+|[_\.]+\z/,""
        
        slug
    end
end
