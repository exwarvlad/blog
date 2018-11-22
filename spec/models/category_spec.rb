require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'validate' do
    it '.format_name' do
      invalid_category = Category.new(name: 'Г контент')
      expect(invalid_category.invalid?).to eq true

      new_category = FactoryBot.create(:category, name: 'Годный контент')
      expect(new_category.valid?).to eq true
    end
  end

  context 'before_save' do
    it 'capitalize name' do
      new_category = FactoryBot.create(:category, name: 'годный контент')
      expect(new_category.name).to eq 'Годный контент'

      new_category.update(name: 'голодный контент')
      expect(new_category.name).to eq 'Голодный контент'
    end
  end
end
