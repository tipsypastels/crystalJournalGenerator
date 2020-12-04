class Pokemon
  LAYOUT = File.read('layouts/pokemon.bbcode')
  SPRITE = File.read('layouts/sprite.txt')

  def initialize(node)
    @node = node
  end

  def to_s
    format(LAYOUT, sprite: sprite, name: name, level: level)
  end
  
  private
  
  def sprite
    SPRITE % id
  end
  
  def name
    if nickname
      "\"#{nickname}\""
    else
      # won't work for post gen-2 with inconsistent naming schemes
      id.capitalize 
    end
  end

  %w[id nickname level].each do |attrib|
    define_method(attrib) { @node.attributes[attrib]&.value }
  end
end