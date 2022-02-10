require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it 'should save when name, price, quantity, and category fields are filled' do

      @category = Category.new(
        id: 3,
      )
      @category.save!
      @product = Product.new(
        name: 'New Product',
        price: 35,
        quantity: 1,
        category_id: 3
      )
      @product.save!
      expect(@product.id).to be_present
    end
    
    it 'should not save if name is blank' do
      @category = Category.new(
        id: 3,  
      )
      @category.save!
      @product = Product.new(
        name: nil,
        price: 35,
        quantity: 1,
        category_id: 3
      )
      @product.save

      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'should not save if price is blank' do
      @category = Category.new(
        id: 2,  
      )
      @category.save!
      @product = Product.new(
        name: 'new product',
        price: nil,
        quantity: 1,
        category_id: 3
      )
      @product.save

      expect(@product.errors.full_messages).to include("Price can't be blank") if !@product.price
    end

    it 'should not save if quantity is blank' do
      @category = Category.new(
        id: 3,  
      )
      @category.save!
      @product = Product.new(
        name: 'new product',
        price: 35,
        quantity: nil,
        category_id: 3
      )
      @product.save

      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'should not save if category is blank' do
      @category = Category.new(
        id: 3,  
      )
      @category.save!
      @product = Product.new(
        name: 'new product',
        price: 35,
        quantity: 1,
        category_id: nil
      )
      @product.save

      expect(@product.errors.full_messages).to include("Category can't be blank")
    end

  end
end