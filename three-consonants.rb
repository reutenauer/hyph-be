#!/usr/bin/env ruby

# Needs Belarusian Hunspell dictionary, packaged by Debian as hunspell-be
cons = 'бвгґджзклмнпрстфхцчш'
# short: йў

words = `unmunch /usr/share/hunspell/be_BY.dic \
  /usr/share/hunspell/be_BY.aff 2>/dev/null`
triplets = []

print "Parsing all #{words.each_line.count} of the Belarusian dictionary: "
n = 0
words.each_line do |word|
  print "#{n}... " if n % 10000 == 0
  word.strip!
  word.scan /[#{cons}]{3}/ do |match|
    triplets << match
  end
  n += 1
end
puts ''

unique_triplets = triplets.sort.uniq
puts "Found #{triplets.count} triplets, #{unique_triplets.count} unique:"
puts unique_triplets
