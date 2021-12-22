#!/usr/bin/ruby:2.7

def slice(amount, investment_limit, total_investments) 
  return [amount] if amount < investment_limit

  if (amount % 2).eql?(0)
    amount = amount/2, amount/2
  else
    amount = amount/2 + amount % 2, amount/2
  end

  amount.each do |investment|
    if investment > investment_limit
      slice(investment, investment_limit, total_investments)
    else
      total_investments.push(investment)
    end
  end

  return total_investments
end

loop do
  input = gets.strip.split.map { |i| i.to_i }
  break if input.eql? [0, 0]

  puts slice(input.first, input.last, []).length
end
