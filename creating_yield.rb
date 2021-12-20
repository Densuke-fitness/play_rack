#eachはgeneratorオブジェクトとしてまとめられる
(1..5).to_a.each { |v| puts v } 

class MyArray

  def initialize(values)
    #array
    @values = values
  end


  def each
    for v in @values
      yield v
    end
  end

end

#ブロック文の中はイテレートしたものをなんやかんやする
#eachはイテレータの生成をしているってことだねもはや。
MyArray.new([1,2,3,4,5]).each { |v| puts v }