class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  # add routes

  get("/bakeries") do
    Bakery.all.to_json

  end 

  get('/bakeries/:id') do
    id = params[:id]
    Bakery.find(id).to_json(include: :baked_goods)
  end 

  get('/baked_goods/by_price') do
    baked_goods =  BakedGood.order(price: :desc)
    baked_goods.to_json
  end 
  
  get('/baked_goods/most_expensive')do
    most_expensive_good = BakedGood.where(price: BakedGood.maximum(:price)).first
    most_expensive_good.to_json
 end

end
