

10.times do
  wholesale_price = Random.new.rand(1.0..100.0).round(2)
  name = FFaker::Lorem.words(5).join(" ")
  description = FFaker::Lorem.sentence
  category = FFaker::Lorem.words(3).join
  sku = FFaker::Lorem.words(2).join
  wholesale = wholesale_price
  retail = wholesale_price * 4
  new_product = Product.new(name: name, description: description, category: category, sku: sku, wholesale: wholesale, retail: retail)
  3.times do
    size = ['xs', 's', 'm', 'l', 'xl', 'xxl'].sample
    color = FFaker::Color.name
    status = [ 'available', 'in transit' ].sample
    new_product.items << Item.create(size: size, color: color, status: status)
  end
  new_product.save
end
