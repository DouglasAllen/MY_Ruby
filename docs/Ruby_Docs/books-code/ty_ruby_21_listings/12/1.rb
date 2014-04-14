#!/usr/bin/env ruby

# A performance test of iterative and recursive functions
# that calculate elements of the Fibonacci sequence.

# The iterative version is not very elegant.
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

# The recursive version is much simpler, but runs slower.
def fib_recursive(n)
  if n<2
    1
  else
    fib_recursive(n-2) + fib_recursive(n-1)
  end
end

5.step(35,5) do |n|
  t_start = Time.now
  answer = fib_iterative(n)
  t_end = Time.now

  printf "fib_iterative(%2d) = %10d;  took %7.2f seconds\n",
    n,answer,(t_end - t_start)

  t_start = Time.now
  answer = fib_recursive(n)
  t_end = Time.now

  printf "fib_recursive(%2d) = %10d;  took %7.2f seconds\n",
    n,answer,(t_end - t_start)

end