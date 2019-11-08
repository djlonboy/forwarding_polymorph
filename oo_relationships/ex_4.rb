# class ScrambledDiary
#   def initialize(contents)
#     @contents = contents
#   end
#
#   def read
#     @contents
#   end
#
#   def scramble_by_advancing_chars(steps)
#     plain_chars = @contents.chars
#     scrambled_chars = plain_chars.map do |char|
#       (char.ord + steps).chr
#     end
#     @contents = scrambled_chars.join
#   end
#
#   def unscramble_by_advancing_chars(steps)
#     scrambled_chars = @contents.chars
#     plain_chars = scrambled_chars.map do |char|
#       (char.ord - steps).chr
#     end
#     @contents = plain_chars.join
#   end
#
#   def scramble_by_reversing
#     @contents = @contents.reverse
#   end
#
#   def unscramble_by_reversing
#     @contents = @contents.reverse
#   end
# end

# Use a polymorphic relationship to extract the different
# scrambling behaviours from ScrambledDiary.

class Scramble
  def initialize(stuff_to_scramble)
    @contents = stuff_to_scramble
  end

  def by(method_of_scrambling)
    method_of_scrambling.process(@contents, :scramble)
  end
end

class Unscramble
  def initialize(stuff_to_unscramble)
    @contents = stuff_to_unscramble
  end

  def by(method_of_unscrambling)
    method_of_unscrambling.process(@contents, :unscramble)
  end
end

class Reversing
  def process(contents, type)
    contents.reverse
  end
end

class Advancing_chars
  def initialize(steps)
    @steps = steps
  end

  def process(contents, type)
    plain_chars = contents.chars
    scrambled_chars = plain_chars.map do |char|
      if type == :scramble
        (char.ord + @steps).chr
      elsif type == :unscramble
      (char.ord - @steps).chr
      end
    end
    scrambled_chars.join
  end
end

p Scramble.new("My name is Rob").by(Reversing.new)
p Unscramble.new("boR si eman yM").by(Reversing.new)
p Scramble.new("My name is Rob").by(Advancing_chars.new(1))
p Unscramble.new("Nz!obnf!jt!Spc").by(Advancing_chars.new(1))
