require 'rubygems'
require 'sitemap_generator'
# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://www.ezbank.com"

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end

  add about_us_path
  add pricing_path, :changefreq => 'daily'
  add apply_case_path, :changefreq => 'daily'
  add banks_path, :changefreq => 'daily'
  add knowledges_path, :changefreq => 'daily'
  add knowledge_home_loan_knowledge_path
  add knowledge_credit_loan_knowledge_path
  add knowledge_car_loan_knowledge_path
  add knowledge_integrate_knowledge_path
  add faq_path
  add privacy_path
  add term_path

  Bank.find_each do |bank|
    add "banks/#{bank.name}"
  end

end
