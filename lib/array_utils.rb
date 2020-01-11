class ArrayUtils

  def self.flatten(input)
    return [] if input.nil?
    raise ArgumentError unless input.is_a?(Array)

    output = []
    input.each do |elem|
      if elem.is_a? Integer
        output << elem
      else
        output += flatten(elem)
      end
    end
    output
  end

end