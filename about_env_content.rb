env = {"rack.version"=>[1, 3],
  "rack.errors"=>
   #<Rack::Lint::ErrorWrapper:0x00007f90a41c0c00 @error=#<IO:<STDERR>>>,
  "rack.multithread"=>true,
  "rack.multiprocess"=>false,
  "rack.run_once"=>false,
  "SCRIPT_NAME"=>"",
  "QUERY_STRING"=>"",
  "SERVER_PROTOCOL"=>"HTTP/1.1",
  "SERVER_SOFTWARE"=>"puma 4.3.1 Mysterious Traveller",
  "GATEWAY_INTERFACE"=>"CGI/1.2",
  "REQUEST_METHOD"=>"GET",
  "REQUEST_PATH"=>"/",
  "REQUEST_URI"=>"/",
  "HTTP_VERSION"=>"HTTP/1.1",
  "HTTP_HOST"=>"localhost:9292",
  "HTTP_USER_AGENT"=>"curl/7.64.1",
  "HTTP_ACCEPT"=>"*/*",
  "puma.request_body_wait"=>0,
  "SERVER_NAME"=>"localhost",
  "SERVER_PORT"=>"9292",
  "PATH_INFO"=>"/",
  "REMOTE_ADDR"=>"::1",
  "puma.socket"=>#<TCPSocket:fd 18, AF_INET6, ::1, 9292>,
  "rack.hijack?"=>true,
  "rack.hijack"=>
   #<Proc:0x00007f90a41c0fc0 /Users/nishio/.rbenv/versions/2.7.0/lib/ruby/gems/2.7.0/gems/rack-2.0.8/lib/rack/lint.rb:525>,
  "rack.input"=>
   #<Rack::Lint::InputWrapper:0x00007f90a41c0c28
    @input=#<Puma::NullIO:0x00007f90a585a8f8>>,
  "rack.url_scheme"=>"http",
  "rack.after_reply"=>[],
  "puma.config"=> #<Puma::Configuration:0x00007f90a41d7798>
  "rack.tempfiles"=>[]
  }

# envの値を利用することで、リクエストに応じたレスポンスを返せます。
# 試しに、以下アプリを作ってみます。