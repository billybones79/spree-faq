module Spree
  class Question < Spree::Base
    acts_as_list

    translates :question, :answer, :fallbacks_for_empty_translations => true
    include SpreeI18n::Translatable
    self.whitelisted_ransackable_attributes = ['question', 'answer']
    self.whitelisted_ransackable_associations = ['question_category']


    belongs_to :question_category, touch: true, inverse_of: :questions

    validates :question_category_id, :question, :answer, presence: true
    validates :question, uniqueness: {
      scope: :question_category,
      case_sensitive: false
    }

    delegate :name, to: :question_category, prefix: true, allow_nil: true

    default_scope { order(position: :asc) }
  end
end
