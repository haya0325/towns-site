require 'rails_helper'

describe Comment do
  describe '#create' do
    # rate, content, category, station, userが存在すれば登録できること
    it "is valid with a rate, content, category, station, user" do
      comment = build(:comment)
      expect(comment).to be_valid
    end
  
    # rateが空では登録できないこと
    it "is invalid without a rate" do
      comment = build(:comment, rate: nil)
      comment.valid?
      expect(comment.errors[:rate]).to include("を入力してください")
    end

    # contentが空では登録できないこと
    it "is invalid without a content" do
      comment = build(:comment, content: nil)
      comment.valid?
      expect(comment.errors[:content]).to include("を入力してください")
    end

    # categoryが空では登録できないこと
    it "is invalid without a category" do
      comment = build(:comment, category: nil)
      comment.valid?
      expect(comment.errors[:category]).to include("を入力してください")
    end
  end
end