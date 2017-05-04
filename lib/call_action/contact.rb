module CallAction
  class Contact
    
    def initialize(hash)
      hash.each do |k,v|
        self.instance_variable_set("@#{k}", v.is_a?(Hash) ? Hashit.new(v) : v)
        self.class.send(:define_method, k, proc{self.instance_variable_get("@#{k}")})
        self.class.send(:define_method, "#{k}=", proc{|v| self.instance_variable_set("@#{k}", v)})
      end
    end


    def activities
    	call_action = CallAction::Api.new
    	call_action.activities self.id
    end	

  end
end  