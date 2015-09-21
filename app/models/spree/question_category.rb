module Spree
  class QuestionCategory < ActiveRecord::Base

    translates :name,
               fallbacks_for_empty_translations: true

    friendly_id :slug_candidates, use: [:history, :globalize]

    include SpreeI18n::Translatable

    acts_as_list

    has_many :questions, -> { order(:position) }, dependent: :destroy, inverse_of: :question_category

    validates :name, presence: true
    validates :name, uniqueness: { case_sensitive: false }

    default_scope { order(position: :asc) }
  end
end
