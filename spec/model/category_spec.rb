require 'rails_helper'

RSpec.describe Category, type: :model do
    
    let(:user)  {User.new(name: "Bilal Ahmed", email: "bilal@gmail.com", password: "password")}
    
    before do
        user.save
    end
    it "is invalid with invalid properties" do
       category = Category.new(name: "Mango", icon: "mcdonalds.png")
        user.categories << category
        expect(category.valid?).to eq(false)
    end

end