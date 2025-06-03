require 'rails_helper'

RSpec.describe Product, type: :model do
  before(:all) do
    @category = Category.create(name: 'Test category')
  end

  describe 'Validation' do
    it "is valid with all required fields" do

      @product = Product.new(
        name: 'Test product',
        price: 100,
        quantity: 5,
        category: @category
      )

      expect(@product).to be_valid
    end

    it "is not valid without name field" do
      @product = Product.new(
        name: nil,
        price: 100,
        quantity: 5,
        category: @category
      )

      @product.valid?
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it "is not valid without price field" do
      @product = Product.new(
        name: 'Test product',
        price: '',
        quantity: 5,
        category: @category
      )

      @product.valid?
      expect(@product.errors.full_messages).to include("Price is not a number")      
    end

    it "is not valid without quantity field" do
      @product = Product.new(
        name: 'Test product',
        price: 100,
        quantity: nil,
        category: @category
      )

      @product.valid?
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it "is not valid without category field" do
      @product = Product.new(
        name: 'Test product',
        price: 100,
        quantity: 5,
        category: nil
      )

      @product.valid?
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end

  end
end