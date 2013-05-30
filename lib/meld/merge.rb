class Meld::Merge
  def initialize( options = {} )
    begin
      @base = options.fetch(:base)
      @this = options.fetch(:this)
      @other = options.fetch(:other)
    rescue KeyError => e
      raise ArgumentError, "wrong number of arguments (#{options.keys.length} for 3)"
    end
  end
end