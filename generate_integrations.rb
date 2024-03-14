require 'yaml'
require 'fileutils'
require 'active_hash'
require_relative 'models/integration'
Dir[File.join(__dir__, 'models/integration', '*.rb')].each do |file|
  require file
end


# Directory where the Jekyll pages will be saved
output_dir = "integrations"
FileUtils.mkdir_p(output_dir) unless Dir.exist?(output_dir)

integrations = Integration.all

integrations.each do |item|

  file_name = File.join(output_dir, "#{item[:slug]}.md")

  File.open(file_name, 'w') do |file|
    file.puts "---"
    file.puts "layout: page"
    file.puts "title: \"#{item.name}\""
    file.puts "brand_color: \"#{item.brand_color}\""
    # file.puts "categories: #{item[:categories].to_yaml.strip}"
    file.puts "description: \"#{item.description.gsub(/\"/, "\\\"")}\""
    file.puts "url: \"#{item.url}\""
    file.puts "---"

    # Output the content of the page
    file.puts "\n# [#{item.name}](#{item.url})\n\n#{item.description}"
    file.puts "![](/assets/images/integrations/#{item.slug}.png)\n\n"

    item.triggers.each do |trigger|
      file.puts "## #{trigger.name}\n\n#{trigger.description}\n\n"
    end
  end

  puts "Generated page for #{item.name}"
end
