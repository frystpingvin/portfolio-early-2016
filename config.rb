###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page "/path/to/file.html", layout: :otherlayout

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

# General configuration

# Turn this on if you want to make your url's prettier, without the .html
activate :directory_indexes

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

###
# Helpers
###

# Create project files from projekt/template
# data.work.projects.each do |project|
#   proxy "/projekt/#{ project([:client]).downcase.gsub(' ', '-') }.html", "/projekt/template.html", :layout => false, :locals => { :project => project }, :ignore => true
# end

data.work.projects.each do |project|
    proxy "/projekt/#{ project.client.downcase.gsub(' ', '-').gsub('åä' , 'a').gsub('ö', 'o') }.html", "/projekt/template.html", :locals => { :project => project }, :ignore => true
end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

# Build-specific configuration
configure :build do
  # Minify CSS on build
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Use relative URLs
  activate :relative_assets
end