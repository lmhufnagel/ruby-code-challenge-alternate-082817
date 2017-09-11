class Category
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_or_create(name)
    cat = self.all.select{|category| category.name == name}
      if nil
      Category.new(name)
    else
    cat
    end
  end

  def article_count
    categories = Hash.new(0)
    Article.all.count do |cat|
      categories[cat] += 1
    end
  end

  def self.top_category
    self.all.max_by(&:article_count)
  end


end
