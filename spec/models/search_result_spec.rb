require 'rails_helper'

RSpec.describe SearchResult, type: :model do
  describe 'validation' do
    it 'is valid with all attributes' do
      search_result = build(:search_result)
      expect(search_result).to be_valid
      expect(search_result.errors).to be_empty
    end

    it 'is invalid without search_word' do
      search_result = build(:search_result, search_word: '')
      expect(search_result).to be_invalid
      expect(search_result.errors[:search_word]).to include("can't be blank")
    end

    it 'is invalid without video_id' do
      search_result = build(:search_result, video_id: '')
      expect(search_result).to be_invalid
      expect(search_result.errors[:video_id]).to include("can't be blank")
    end

    it 'is invalid without title' do
      search_result = build(:search_result, title: '')
      expect(search_result).to be_invalid
      expect(search_result.errors[:title]).to include("can't be blank")
    end

    it 'is invalid without thumbnail' do
      search_result = build(:search_result, thumbnail: '')
      expect(search_result).to be_invalid
      expect(search_result.errors[:thumbnail]).to include("can't be blank")
    end
  end
end
