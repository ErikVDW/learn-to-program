def beer_on_the_wall ( start = 100 )
  while start > 0
    puts "#{start} bottles of beer on the wall, #{start} bottles of beer!\nTake one down pass it around,\n#{start-1} bottles of beer on the wall!"
    start -= 1
  end
end
@bye_count=0
def old_grandma ( sentence )
  if sentence.upcase === sentence
    if sentence === "BYE"
      @bye_count += 1
      if @bye_count === 3
        puts "BYE SONNY!"
      else
        puts "NO STAY!"
      end
    else
      @bye_count = 0
      puts "I understand"
    end
  else
    puts "WHAT I DIDN\'T HERE YOU!"
  end
end

def leap_years ( startYear, endYear )
  leapYear = Proc.new do |testYear|
    puts "#{testYear} IS a leap year!"
  end
  for testYear in startYear..endYear
    if testYear % 100 === 0
      if testYear % 400 === 0
        leapYear.call testYear
      end
    elsif testYear % 4 === 0
      leapYear.call testYear
    end
  end
end
def sort_words
  x = 0
  array = []
  word = nil
  while word != ''
    p 'Input sentence:'
    word = gets.chomp
    array[x] = word
    x += 1
  end
  array.sort.join(', ')
end

def englishNumber number #223 | 2
  if number < 0  # No negative numbers. NA | NA
    return 'Please enter a number that isn\'t negative.'
  end
  if number == 0 # NA | NA
    return 'zero'
  end

  # No more special cases! No more returns!

  numString = ''  # This is the string we will return. = emptystring

  onesPlace = ['one',     'two',       'three',    'four',     'five',
               'six',     'seven',     'eight',    'nine']
  tensPlace = ['ten',     'twenty',    'thirty',   'forty',    'fifty',
               'sixty',   'seventy',   'eighty',   'ninety']
  teenagers = ['eleven',  'twelve',    'thirteen', 'fourteen', 'fifteen',
               'sixteen', 'seventeen', 'eighteen', 'nineteen']

  # "left" is how much of the number we still have left to write out.
  # "write" is the part we are writing out right now.
  left  = number # 223 | 2
  write = left/100        # How many hundreds left to write out? 2 | 0
  left  = left - write*100  # Subtract off those hundreds. 23 | 2

  if write > 0 # yes
    # Now here's a really sly trick:
    hundreds  = englishNumber write # call englishNumber with parameter of 2.  hundreds = 
    numString = numString + hundreds + ' hundred' # 
    # That's called "recursion". So what did I just do?
    # I told this method to call itself, but with "write" instead of
    # "number". Remember that "write" is (at the moment) the number of
    # hundreds we have to write out. After we add "hundreds" to
    # "numString", we add the string ' hundred' after it.
    # So, for example, if we originally called englishNumber with
    # 1999 (so "number" = 1999), then at this point "write" would
    # be 19, and "left" would be 99. The laziest thing to do at this
    # point is to have englishNumber write out the 'nineteen' for us,
    # then we write out ' hundred', and then the rest of
    # englishNumber writes out 'ninety-nine'.

    if left > 0
      # So we don't write 'two hundredfifty-one'...
      numString = numString + ' '
    end
  end

  write = left/10          # How many tens left to write out?
  left  = left - write*10  # Subtract off those tens.

  if write > 0
    if ((write == 1) and (left > 0))
      # Since we can't write "tenty-two" instead of "twelve",
      # we have to make a special exception for these.
      numString = numString + teenagers[left-1]
      # The "-1" is because teenagers[3] is 'fourteen', not 'thirteen'.

      # Since we took care of the digit in the ones place already,
      # we have nothing left to write.
      left = 0
    else
      numString = numString + tensPlace[write-1]
      # The "-1" is because tensPlace[3] is 'forty', not 'thirty'.
    end

    if left > 0
      # So we don't write 'sixtyfour'...
      numString = numString + '-'
    end
  end

  write = left  # How many ones left to write out?
  left  = 0     # Subtract off those ones.

  if write > 0
    numString = numString + onesPlace[write-1]
    # The "-1" is because onesPlace[3] is 'four', not 'three'.
  end

  # Now we just return "numString"...
  numString
end

class OrangeTree
  def initialize
    
  end
  def oneYearPasses
    height += 6
    age += 1
    if age >3
      numOranges = age**1.5
    end
    if age > 40
      dead = true
    end
  end
  def countTheOranges
    p "There are #{numOranges} oranges."
  end
  def pickTheOranges
    numOranges = 0
  end
    
end

def grandfather_clock &block
  times = Time.new.hour
  times += 1
  times - 12 if times > 12
  for i in 1..times
    block.call
  end
end

$depth = 0
def log blockDescription, &block 
  print "\t"*($depth)
  p "Beginning block ##{$depth}: " + blockDescription
  $depth += 1
  value_returned = block.call
  $depth -= 1
  print "\t"*($depth)
  p "Finished ##{$depth}: " + blockDescription + " - returned: " + value_returned.to_s
end
log 'CALL LOG' do
  log "CALL LAST BLOCK: 'Yay!'" do
    'Yay!'
  end
end

log 'outer block' do
  log 'some little block' do
    log 'teeny-tiny block' do
    'lots of love'
    end
  42
  end
  log 'yet another block' do
    'I love Indian food!'
  end
  true
end