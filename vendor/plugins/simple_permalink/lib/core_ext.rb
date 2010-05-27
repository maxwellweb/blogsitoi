String.class_eval do
  def to_url
    result = self.downcase
    result.gsub!("Ñ", "ñ")
    result.gsub!("Ç", "ç")
    
    result.gsub!(/[áàäâå]/, 'a')
    result.gsub!(/[éèëê]/, 'e')
    result.gsub!(/[íìïî]/, 'i')
    result.gsub!(/[óòöô]/, 'o')
    result.gsub!(/[úùüû]/, 'u')
    result.gsub!(/[ñ]/, 'n')
    result.gsub!(/[ç]/, 'c')
    
    result.gsub!(/['":]/, '')   
    result.gsub!(/[·]/, '-')   
    result.gsub!(/^(\s*)/, '')
    result.gsub!(/(\s*)$/, '')
    result.gsub!(/\W/, '-');

    result.gsub!(/^(-+)/, '')
    result.gsub!(/(-+)$/, '')
    result.gsub!(/-+/, '-')
    
    result
  end
end