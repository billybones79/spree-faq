class MakeFaqTranslatable < ActiveRecord::Migration

  def up
    Spree::Question.create_translation_table!({ question: :text, answer: :text }, { migrate_data: true })
    Spree::QuestionCategory.create_translation_table!({ name: :string }, { migrate_data: true })
  end

  def down
    Spree::Product.drop_translation_table! migrate_data: true
    Spree::Promotion.drop_translation_table! migrate_data: true
  end

end