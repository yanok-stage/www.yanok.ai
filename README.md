# www.yanok.ai

## Setup

* Buidl image: `docker build -t www.yanok.ai .`
* Install node deps: `docker run --rm -p "4000:4000" -v "$(pwd):/site" -it www.yanok.ai npm install`
* Install bundler deps: `docker run --rm -p "4000:4000" -p "35729:35729" -v "$(pwd):/site" -v "$(pwd)/.bundle_cache:/usr/local/bundle/" -it www.yanok.ai bundle install`
* Run jekyll: `docker run --rm -p "4000:4000" -p "35729:35729" -v "$(pwd):/site" -v "$(pwd)/.bundle_cache:/usr/local/bundle/" -it www.yanok.ai`

## Generating Integration Pages

`docker run --rm -p "4000:4000" -v "$(pwd):/site" -v "$(pwd)/.bundle_cache:/usr/local/bundle/" -it www.yanok.ai bundle exec ruby generate_integration_pages.rb`
