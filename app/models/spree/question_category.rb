module Spree
  class QuestionCategory < Spree::Base
    acts_as_list

    self.whitelisted_ransackable_attributes = ['name']
    self.whitelisted_ransackable_associations = nil


    translates :name, :fallbacks_for_empty_translations => true
    include SpreeI18n::Translatable

    has_many :questions, -> { order(:position) }, dependent: :destroy, inverse_of: :question_category

    validates :name, presence: true
    validates :name, uniqueness: { case_sensitive: false }

    default_scope { order(position: :asc) }
  end
end
