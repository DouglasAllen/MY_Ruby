
```ruby
def some_method(x, y, z, h)
  p x, y, z
  p h
end

some_method(10, 20, 30, x: 10, y: 30)

def method2(h)
  p h
end

method2(x: 10, y: 30)

def method3(options = { x: 10, y: 20, z: 30 })
  p options
end

method3(x: 1, y: 2, z: 3)
method3(x: 1, y: 2)

def method4(options = {})
  defaults = { x: 10, y: 20, z: 30 }
  options = defaults.merge(options)
  p options
end

method4(x: 1, y: 2, z: 3)
method4(x: 1, y: 2)

def method5(x: 10, y: 20, z: 30)
  p x, y, z
end

method5(x: 1, y: 2, z: 3)
method5(x: 1, y: 2)

def method6(a, x: 10, y: 20, z: 30)
  p x, y, z
  p a
end

method6(x: 1, y: 2, z: 3)
method6(50, x: 1, y: 2)

def method7(x, y, z)
  p x, y, z
end

method7(x: 1, y: 2)

def method8(x: nil, y: nil, z: nil)
  p x, y, z
end

method8(x: 1, y: 2)

def my_method(*args)
  p args
end

my_method(10, 20, 30)

def my_method2(x: 10, y: 20, **args)
  p x, y, args
end

my_method2(c: 'test', x: 1, y: 2, z: 100, a: 42)

def my_method3(x: 10, y: 20)
  p x, y
end

my_method3(c: 'test', x: 1, y: 2, z: 100, a: 42)

def my_method4(**args)
  p args
end

my_method4(c: 'test', x: 1, y: 2, z: 100, a: 42)
```
