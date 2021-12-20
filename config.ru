# class  HelloRackApp
#     def call(env)
#       #responsecode, http-Header, shema  
#       [
#         # 1番目はStatusで、3桁の数値を返す
#         200, 
#         # 2番目はHeaders, Hashはeachメソッドを実装済, key/valueはStringあること
#         {"Content-Type" => "text/plain"}, 
#         # 3番目はBody, Arrayはeachメソッドを実装済みなので動く。イテレートする
#         ["Hello Rack!"]
#       ]
#     end
# end

# run HelloRackApp.new

# class MyHeader
#   def initialize(bodies)
#     @bodies = bodies
#   end

#   def each
#     yield "Content-Type", "text/plain"
#     yield "Content-Length", @bodies.join.bytesize.to_s # NOTE: ValueはStringにしないといけない
#   end
# end

# class MyBody
#   def initialize(bodies)
#     @bodies = bodies
#   end

#   def each
#     for v in @bodies
#       yield v
#     end
#   end
# end

# # NOTE: procはcallで呼び出し可能
# app = proc do |env|
#   bodies = ["こんにちはRack!\n\n", "Hello Rack!\n"]

#   [200, MyHeader.new(bodies), MyBody.new(bodies)]
# end

# run app

# class App
#   def call(env)
#     # NOTE:
#     #   REQUEST_PATHも利用できるが、実装されていないケースが存在する
#     #   PATH_INFOは必ず存在するので、urlはPATH_INFOを使って取り出す方が安全である
#     #   https://github.com/envato/jwt_signed_request/issues/15
#     path = env["PATH_INFO"]

#     if path == "/hello"
#       [200, { "Content-Type" => "text/plain" }, ["HELLO!"]]
#     else
#       [404, { "Content-Type" => "text/plain" }, ["404 Not Found"]]
#     end
#   end
# end

# run App.new

# class App
#   def call(env)
#     [200, { "Content-Type" => "text/plain" }, ["HELLO Rack Endpoint!\n\n"]]
#   end
# end

# # Rack Middlewareは以下条件を満たす必要がある
# #   - classであること
# #   - initializeでappを受け取ること
# #   - callメソッドを実装し、Status/Headers/Bodyを返すこと (Rack Endpointと同じ条件)
# class HelloRackMiddleware
#   def initialize(app)
#     @app = app
#   end

#   def call(env)
#     status, headers, body = @app.call(env)

#     fixed_body = ["Hello Rack Middleware!\n"] + body

#     [status, headers, fixed_body]
#   end
# end

# use HelloRackMiddleware
# run App.new

# 間の処理をいい感じにしてくれるのがMiddleware! => レスポンスをする際の内部のハンドリングを担当する

# class App
#   def call(env)
#     [200, { "Content-Type" => "text/plain" }, ["HELLO Rack Endpoint!\n\n"]]
#   end
# end

# class HelloRackMiddleware
#   def initialize(app)
#     @app = app
#   end

#   def call(env)
#     status, headers, body = @app.call(env)

#     fixed_body = ["Hello Rack Middleware!\n"] + body

#     [status, headers, fixed_body]
#   end
# end

# class AnotherMiddleware
#   def initialize(app)
#     @app = app
#   end

#   def call(env)
#     status, headers, body = @app.call(env)

#     fixed_body = ["Another Middleware!\n"] + body

#     [status, headers, fixed_body]
#   end
# end

# use HelloRackMiddleware
# use AnotherMiddleware
# run App.new

class App
  def call(env)
    [200, { "Content-Type" => "text/plain" }, ["HELLO WORLD!", "Hello"]]
  end
end

class ContentLengthMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, body = @app.call(env)
    body_size = 0

    body.each do |b|
      body_size += b.bytesize
    end
    headers["Content-Length"] = body_size.to_s

    [status, headers, body]
  end
end

use ContentLengthMiddleware

run App.new
