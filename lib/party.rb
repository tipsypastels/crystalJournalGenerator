class Party
  LAYOUT = File.read('layouts/party.bbcode')

  include Enumerable

  delegate :[], :each, to: :@mons

  def initialize(episode)
    if episode.respond_to?(:party)
      @mons = episode.party.elements.map(&Pokemon.method(:new))
    end
  end

  def to_s
    return format(LAYOUT, mons: @mons.join) if @mons.present?
    ''
  end
end