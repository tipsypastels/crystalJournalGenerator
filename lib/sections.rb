class Sections
  def initialize(episode)
    if episode.respond_to?(:sections)
      @sections = episode.sections.elements.map(&Section.method(:new))
    end
  end

  def to_s
    return @sections.join if @sections
    ''
  end
end