mfib = { n ->
  if(0 == n) return 0;
  if(1 == n) return 1;
  return mfib(n-1) + mfib(n-2)
}.memoize()

fib = { n ->
  if(0 == n) return 0;
  if(1 == n) return 1;
  return fib(n-1) + fib(n-2)
}

def benchmark = { closure ->  
  start = System.currentTimeMillis()  
  closure.call()
  now = System.currentTimeMillis()  
  println("Execution took '${now - start}'")
}  

n = 31
benchmark {
  println (fib.call(n))
}
benchmark {
  fib = fib.memoize()
  println(fib(30))
}
benchmark {
  println(mfib(n))
}
benchmark {
  println(mfib(n))
}
