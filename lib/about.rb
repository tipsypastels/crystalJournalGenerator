class About
  LAYOUT = File.read('layouts/about.bbcode')

  def initialize(episode)
    @text = episode.about.content if episode.respond_to?(:about)
  end

  def to_s
    return format(LAYOUT, text: @text) if @text
    ''
  end
end