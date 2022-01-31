products_data = []
200.times do |t|  
  product = {}
  product[:name] = Faker::Commerce.product_name
  product[:description] = Faker::Lorem.paragraph(sentence_count: 2, supplemental: false, random_sentences_to_add: 4)
  product[:price] = SecureRandom.random_number(1..10000)
  products_data << product
end

products_data.each_with_index do |product,idx|      
  Product.create! product
  puts "#{idx}"  
end