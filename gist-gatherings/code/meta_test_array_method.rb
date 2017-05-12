class Array
  def foldin(method)
    inject {|result, i| result ? result.send(method, i) : i }
  end
end

[(def hello;'Hello from inside the first element';end), (puts hello)].foldin("eval")
