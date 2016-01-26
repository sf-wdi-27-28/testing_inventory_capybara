require "rails_helper"

describe "editing a product" do

  let(:name)        { 'Rhinoceros' }
  let(:description) { 'Odd-toed ungulate' }
  let(:category)    { 'Perissodactyla' }
  let(:sku)         { 'newsku' }
  let(:wholesale)   { 1480900 }
  let(:retail)      { 2000000 }

  before do
    # since we're creating the product here (outside of the browser),
    # we must use Database Cleaner's truncation strategy.
    product = FactoryGirl.create(:product)
    visit "/products/#{product.id}"

    click_on 'Edit Product'
  end

  it 'saves the edited product' do
    fill_in 'product_name', with: name
    fill_in 'product_description', with: description
    fill_in 'product_category', with: category
    fill_in 'product_sku', with: sku
    fill_in 'product_wholesale', with: wholesale
    fill_in 'product_retail', with: retail
    click_button 'Save Product'

    # verify we're on a page like /products/3
    expect(page.current_path).to match(/products\/\d+?$/)

    expect(page).to have_content name
    expect(page).to have_content description
    expect(page).to have_content category
    expect(page).to have_content sku
    expect(page).to have_content '$1,480,900.00'
    expect(page).to have_content '$2,000,000.00'
  end

end
