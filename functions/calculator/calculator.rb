class Calculator
  def factorial_of(n)
    (1..n).inject(:*)
  end

  def square_of(n)
    n ** 2
  end

  def product_of(m, n)
    m * n
  end

  def greet(name)
    "Hello #{name}!"
  end
end
