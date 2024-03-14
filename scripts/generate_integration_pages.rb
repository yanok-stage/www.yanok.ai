require 'yaml'
require 'fileutils'
require 'active_hash'
require_relative '../models/integration'
Dir[File.join(__dir__, '../models/integration', '*.rb')].each do |file|
  require file
end


# Directory where the Jekyll pages will be saved
output_dir = "integrations"
FileUtils.mkdir_p(output_dir) unless Dir.exist?(output_dir)

integrations = Integration.all;
threads = [] # Array to hold the threads

integrations.each do |item|
  threads << Thread.new do
    file_name = File.join(output_dir, "#{item.slug}.html")

    File.open(file_name, 'w') do |file|
      file.puts "---"
      file.puts "layout: integration"
      file.puts "sitemap: false"
      file.puts "title: \"#{item.name}\""
      file.puts "brand_color: \"#{item.brand_color}\""
      file.puts "categories: #{item.categories}"
      file.puts "description: \"#{item.description.gsub(/\"/, "\\\"")}\""
      file.puts "url: \"#{item.url}\""
      file.puts "---"

      triggers_html = item.triggers.map do |trigger|
        <<~EOF
  <div class="flex flex-col items-start">
    <div class="font-semibold">#{trigger.name}</div>
    <div>#{trigger.description}</div>
  </div>
        EOF
      end.join("\n")

      actions_html = item.actions.map do |action|
        <<~EOF
  <div class="flex flex-col items-start">
    <div class="font-semibold">#{action.name}</div>
    <div>#{action.description}</div>
  </div>
        EOF
      end.join("\n")

      file.puts <<~EOF
  <div class="flex flex-col items-center pt-10">
    <div class="flex flex-row gap-12">
      <img class="size-20" src="/assets/images/integrations/#{item.slug}.png" />
      <div class="flex items-center justify-between grow">
        <h1>
          #{item.name} Integrations
          <span class="block max-w-full h-0.5" style="background-color: #{item.brand_color}"></span>
        </h1>
      </div>
    </div>
    <p class="max-w-3xl mt-8 text-center">#{item.description}</p>

    <div class="flex flex-col items-center mt-20">
      <h2 class="text-2xl font-bold">Triggers</h2>
      <div class="flex flex-col gap-5">
        #{triggers_html}
      </div>
    </div>

    <div class="flex flex-col items-center mt-20">
      <h2 class="text-2xl font-bold">Actions</h2>
      <div class="flex flex-col gap-5">
        #{actions_html}
      </div>
    </div>
  </div>

  <div class="site-gutter max-w-container mx-auto flex flex-col items-center gap-5 py-14">
    <p><span class="font-bold">Yanok Platform</span> is a powerhouse in web automation, acting as the essential
      connector to a multitude of web apps and
      services, seamlessly enabling them to collaborate.</p>
    <p>Create seamless integration with an intuitive no-code drag-and-drop interface.</p>
    <div class="block pt-5 flex flex-col md:flex-row gap-5 justify-center items-center">
      <a href="https://app.yanok.xyz/quickstarts/business/new" class="btn btn-cta btn-xl">Automate with Yanok</a>
      <a href="/book-demo.html" class="btn ">Book a Demo</a>
    </div>
  </div>

      EOF
    end

    puts "Generated page to #{file_name}\t\t#{item.name}"
  end
end

threads.each(&:join)
