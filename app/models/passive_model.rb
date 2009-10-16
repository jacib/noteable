class PassiveModel
  include Validatable
  
  def initialize(fields = {})
    fields.each do |key, val|
      if methods.include?("#{key}") && methods.include?("#{key}=")
        send "#{key}=", val
      end
    end
  end
  
  def self.column(name)
    attr_accessor name
  end
end