require "core_ext"

class << ActiveRecord::Base
  def permalink( attr )
    class_eval <<-EOF, __FILE__, __LINE__
      before_validation_on_create do |r|
        unless r.#{attr}.nil?
          total = count(:conditions => {:permalink => r.#{attr}.to_url})
          r.permalink = total.zero? ? r.#{attr}.to_url : r.#{attr}.to_url + "-" + total.to_s
        end
      end
    EOF
  end
end


