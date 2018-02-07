require 'rails_helper'

describe CartDecorator do
  let(:item_1) { create(:item) }
  let(:item_2) { create(:item) }

  let(:decorated_cart) { CartDecorator.new(Cart.new({"#{item_1.id}" => 2,
                  "#{item_2.id}" => 3
                  })) }

  it "#cart_items gives an array of Item objects in cart" do
    expect(decorated_cart.cart_items).to be_a Array
    expect(decorated_cart.cart_items.first).to be_a Item
    expect(decorated_cart.cart_items.last).to be_a Item
  end

  it "#cart_items_quantity gives single item's quantity for this cart" do
    expect(decorated_cart.quantity_of(item_1.id)).to eq 2
    expect(decorated_cart.quantity_of(item_2.id)).to eq 3
  end

  it "#subtotal gives the subtotal for one item in cart" do
    expect(decorated_cart.subtotal(item_1)).to eq 20.0
    expect(decorated_cart.subtotal(item_2)).to eq 30.0
  end

  it "#total gives the total for the cart" do
    expect(decorated_cart.total).to eq 50.0
  end
end
