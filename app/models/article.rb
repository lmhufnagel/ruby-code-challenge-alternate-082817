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
