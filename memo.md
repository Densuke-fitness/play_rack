Rackアプリはアプリサーバーと通信するために、以下の形式(プロトコル)にしたがって作成する必要があります。

RackアプリはObjectであり、callメソッドを呼び出せること。callメソッドは引数を一つ受け取ること
callメソッド呼び出し後、以下3つの値を配列として返すこと
- (HTTP) Status Code
  - Status Codeは3桁のHTTPのステータスコード(100以上の数値)であること
- Headers
  - Headersはeachメソッドを実装し、yieldの際にkey/valueのペアを渡すこと。key/valueは必ずStringであること
- Body
  - Bodyはeachメソッドを実装し、yieldの際にStringを渡すこと


