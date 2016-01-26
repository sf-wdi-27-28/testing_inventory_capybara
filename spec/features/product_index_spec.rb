require "rails_helper"

# this spec is written much like many view specs are.
# It deals with only one page and verifies its content.
# It's still an integration spec though, it uses the view, controller and model.

describe "product index page" do
  # one product
  let!(:product0) { FactoryGirl.create(:product) }

  before do
    # create 3 more products
    3.times { FactoryGirl.create(:product) }

    visit '/'
  end

  it 'shows all the products' do
    expect(page).to have_css('.product', count: 4)
  end

  it 'lists the title and sku' do
    expect(page).to have_content product0.name
    expect(page).to have_content product0.sku
  end
end
