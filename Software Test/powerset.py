import itertools

stuff = [1,1,1,1,1,1,1,1,1,1,1,1,1,1]

# print (len(stuff))
#
# comb = []
#
#
# for L in range(0, len(stuff)+1):
#   for subset in itertools.combinations(stuff, L):
#     comb.append(subset)
#
# print(comb)

combs = []

for i in xrange(1,len(stuff)+1):
    els = [list(x) for x in itertools.combinations(stuff, i)]
    combs.extend(els)

#print combs

sums = []

for j in combs:
    sums.append(sum(j))

print sums
print len(combs)
print len(sums)
