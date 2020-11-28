class Application
    def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
        item_name = req.path.split('/').last
        if @@items.find{|i| i.name == item_name}.nil?
            resp.write "Item not found"
            resp.status = 400
        else
            item_price = @@items.find{|i| i.name == item_name}.price
            resp.write item_price
        end
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end
end