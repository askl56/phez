require "rails_helper"

RSpec.describe Comment, type: :model do

  describe "check validations" do
    context "validates presence" do
      it 'is valid with both body and user' do
        u = user.create(:user)
        comment = Comment.new(body: "hello", user: u)
        comment.valid?
        expect(comment).to be_valid

      end

      it 'is not valid without a body' do
        comment = Comment.new(body: nil)
        comment.valid?
        expect(comment.errors[:body]).to include("can't be blank")
      end

      it 'is not valid without a user' do
        comment = Comment.new(user: nil)
        comment.valid?
        expect(comment.errors[:user]).to include("can't be blank")
      end
    end

    # context "rewards and upvotes" do

    #   it 'rewards a comment' do
    #     comment = FactoryGirl.build(:comment)
    #     comment.reward!
    #     expect(comment.is_rewarded).to be_truthy

    #   end

    # end

  end
end
