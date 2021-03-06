# vim: ts=4 sw=4 expandtab
module LanguageFilterable
  extend ActiveSupport::Concern

  included do
    belongs_to :language

    def self.filter_by_language_or_default(language)
      language = Language.find_by_id_or_iso_code(language || 'en')

      find_by(language: language) || find_by(language: Language.default)
    end
  end
end
