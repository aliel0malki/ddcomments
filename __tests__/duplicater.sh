# deplucate test.c file 100 times
for i in {1..1000}
do
	cp __tests__/test.c __tests__/test${i}.c
done
