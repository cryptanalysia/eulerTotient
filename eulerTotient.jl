using Primes

function eulerTotient(x)
	result = 1
	for p in factor(x)
		if p[2] == 1
			result *= p[1]-1
		else
			result *= (p[1]-1)*(p[1]^(p[2]-1))
		end
	end
	return result
end

function eulerTotientShort(x)
	result = 1
	for p in factor(x)
		result *= (p[1]-1)*(p[1]^(p[2]-1))
	end
	return result	
end

function eulerTotientOneliner(x)
	return reduce(*, [(p[1]-1)*(p[1]^(p[2]-1)) for p in factor(x)])
end


function main()
	println(reduce((x,y) -> x && y, 
				[eulerTotient(i) == eulerTotientShort(i) == 
				eulerTotientOneliner(i) for i=1:10000]))
	@time [eulerTotient(i) for i=1:10000]
	@time [eulerTotientShort(i) for i=1:10000]
	@time [eulerTotientOneliner(i) for i=1:10000]
end


main()
