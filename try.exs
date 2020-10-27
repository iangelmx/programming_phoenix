# Write a function that takes three arguments.
# If the first two are zero, return “FizzBuzz.”
# If the first is zero, return “Fizz.”
# If the second is zero, return “Buzz.”
# Otherwise return the third argument.
# Do not use any language features that we haven’t yet covered in this book.

function = fn
0,0,_c->"FizzBuzz"
0,_b,_c->"Fizz"
_a,0,_c->"Buzz"
_a,_b,c->c
end
test = fn n -> function.(rem(n,3),rem(n,5),n) end
for a <- 0..100, do: IO.puts "#{test.(a)}"
# IO.puts "#{test.(10)}"
# IO.puts "#{test.(11)}"
# IO.puts "#{test.(12)}"
# IO.puts "#{test.(13)}"
# IO.puts "#{test.(14)}"
# IO.puts "#{test.(15)}"
# IO.puts "#{test.(16)}"
# IO.puts "#{test.(17)}"

# test.(10,11,12)
# test.(13,14,15)
# test.(16,17,18)
# test.(19,20,21)
# test.(22,23,24)
# test.(25,26,27)
# test.(28,29,30)
