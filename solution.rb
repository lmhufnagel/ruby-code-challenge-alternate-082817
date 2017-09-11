# Please copy/paste all three classes into this file to submit your solution!
class Adapter
  attr_accessor :file, :articles

  def initialize(file)
    @file = file
    @articles = self.class.articles(file)
  end

  def self.articles(file)
    JSON.parse(File.read(file))
  end

  def create_objects_from_file
    Article.new(article["title"], article["description"], article["url"], article["contributor"], article["publishedAt"], article["category"])
  end

end
---------------------------------------
class Article

  attr_accessor :title, :description, :url, :contributor, :publishedAt, :category

  @@all = []

  def initialize(title, description, url, contributor, publishedAt, category)
    @title = title
    @description = description
    @url = url
    @contributor = contributor
    @time_published = publishedAt
    @category = category
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_all_by_category(category)
    self.all.select do |article|
      article.category == category
    end
  end

end
------------------------------------
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
