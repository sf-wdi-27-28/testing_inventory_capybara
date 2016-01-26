require "rails_helper"


describe "creating a new product" do

  before { visit '/products/new' }

  it 'shows a form for creating a product' do
    expect(page).to have_css('form')
  end

  it 'saves the new product' do
    fill_in 'product_name', with: 'Shades'
    fill_in 'product_description', with: 'test description'
    fill_in 'product_category', with: 'sunglasses'
    fill_in 'product_sku', with: 'asdf1234'
    fill_in 'product_wholesale', with: 2.40
    fill_in 'product_retail', with: 27.00
    click_button 'Save Product'

    # verify we're on a page like /products/3
    expect(page.current_path).to match(/products\/\d+?$/)

    expect(page).to have_content 'Shades'
    expect(page).to have_content 'test description'
    expect(page).to have_content 'asdf1234'
    expect(page).to have_content '2.40'
    expect(page).to have_content '27.00'
  end

  context 'when the form is incomplete' do
    it 'displays an error message' do
      click_button 'Save Product'
      expect(page.find('.alert-danger')).to have_content "Name can't be blank, Description can't be blank,"
      expect(page.find('.alert-danger')).to have_content "Category can't be blank, Sku can't be blank,"
      expect(page.find('.alert-danger')).to have_content " Wholesale can't be blank, Retail can't be blank"
    end
  end
end
