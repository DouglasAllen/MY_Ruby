def BruteForce(topCandidate)
  totalCount = 1
  isPrime = true

  3.step(topCandidate, 2) do |i|
    j=3

    while j*j <= i && isPrime
      isPrime = false if i%j==0
      j += 2
    end

    isPrime ? totalCount += 1 : isPrime = true
  end

totalCount
end

def SieveOfEratosthenes(topCandidate)
  myBA1 = Array.new(topCandidate + 1) {true}
  myBA1[0] = myBA1[1] = false
  thisFactor = 2

  while thisFactor * thisFactor <= topCandidate do
    mark = thisFactor + thisFactor
    mark.step(topCandidate+1, thisFactor) {|n| myBA1[n] = false}

    thisFactor += 1

    while !myBA1[thisFactor] do
      thisFactor += 1
    end

  end

  myBA1.count(true)
end

def SieveOfSundaram(topCandidate)
  k = topCandidate / 2
  myBA1 = Array.new(k + 1) {true}
  myBA1[0] = myBA1[k] = false

  for i in 1..k do
    denominator = (i << 1) + 1
    maxVal = (k - i) / denominator
    i.step(maxVal+1, 1) {|n| myBA1[i + n * denominator] = false}

    # this version takes .20 seconds longer to run 1M iterations!
    # for n in i..maxVal+1 do
      # myBA1[i + n * denominator] = false
    # end
  end

myBA1.count(true) + 1
end

def main
  max = 1000000
  startTime = Time.now()
  primes = BruteForce(max)
  endTime = Time.now()
  elapsed = endTime - startTime
  printf("Elapsed time for Brute Force : %f Primes = %d\n", elapsed, primes)

  startTime = Time.now()
  primes = SieveOfEratosthenes(max)
  endTime = Time.now()
  elapsed = endTime - startTime
  printf("Elapsed time for Sieve of Eratosthenes: %f Primes = %d\n", elapsed, primes)

  startTime = Time.now()
  primes = SieveOfSundaram(max)
  endTime = Time.now()
  elapsed = endTime - startTime
  printf("Elapsed time for Sieve of Sundaram : %f Primes = %d\n", elapsed, primes)
end

main