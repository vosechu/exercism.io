class Trail

  attr_reader :exercises, :locale, :path
  def initialize(locale, slugs, path)
    @locale = locale
    @exercises = slugs.map {|slug| Exercise.new(locale.to_s, slug)}
    @path = path
  end

  def language
    locale.language
  end

  def find(slug)
    exercises.find {|ex| ex.slug == slug}
  end

  def assign(slug)
    Assignment.new(locale, slug, path)
  end

  def first
    exercises.first
  end

  def after(exercise)
    exercises[exercises.index(exercise)+1]
  end

end
