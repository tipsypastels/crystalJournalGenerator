class Section
  LAYOUT = File.read('layouts/section.bbcode')
  TYPES  = JSON.parse(File.read('layouts/section_types.json'))

  def initialize(node)
    @node = node
  end

  def to_s
    format(LAYOUT, name: name, icon: icon, color: color, content: content)
  end

  private

  def name
    @node.attributes.fetch('name').value
  end

  def type
    @node.attributes.fetch('type').value
  end

  def icon
    TYPES.fetch(type)['icon']
  end

  def color
    TYPES.fetch(type)['color']
  end

  def content
    @node.content.strip
  end
end