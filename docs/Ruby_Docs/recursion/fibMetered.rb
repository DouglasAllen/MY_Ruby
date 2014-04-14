def fibMetered(x)
    $numCalls
    $numCalls += 1
    if x == 0 or x == 1
        return 1
    else
        return fibMetered(x-1) + fibMetered(x-2)
	 end
end

def testFib(n)
    for i in 0..n+1
        $numCalls
        $numCalls = 0
        puts 'fib of ' + (i).to_s + ' = ' + (fibMetered(i)).to_s
        puts 'fib called ' + ($numCalls).to_s + ' times'
	  end
end	  
	  
n = 5
testFib(n)