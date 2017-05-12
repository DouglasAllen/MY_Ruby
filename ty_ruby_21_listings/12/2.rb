#!/usr/local/bin/ruby

# A performance test of recursively calculating elements
# of the Fibonacci sequence, with and without memoizing.

# Simplest recursive version
def fib_iterative(n)
  if n<2
    1
  else
    prev_1 = prev_2 = 1
    new_elt = 0           # (scope is important, value isn't)
    2.upto(n) do
      new_elt = prev_1 + prev_2       # get the newest element
      prev_1,prev_2 = prev_2,new_elt  # update the stored elements
    end
    new_elt
  end
end

# Recursive version with memoization
@memo = []    # initially empty results array
def fib_memoized(n)
  # If we don't already know the answer, we have to find it.
  if not @memo[n]
    if n<2
      @memo[n] = 1
    else
      @memo[n] = fib_memoized(n-2) + fib_memoized(n-1)
    end
  end

  # At this point, we always have a stored answer to return.
  @memo[n]
end

5.step(35,5) do |n|
  t_start = Time.now
  answer = fib_iterative(n)
  t_end = Time.now

  printf "fib_iterative(%2d) = %10d;  took %7.2f seconds\n",
    n,answer,t_end-t_start

  t_start = Time.now
  answer = fib_memoized(n)
  t_end = Time.now

  printf "fib_memoized(%2d)  = %10d;  took %7.2f seconds\n",
    n,answer,t_end-t_start

end