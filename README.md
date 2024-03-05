# www.yanok.ai

## Setup

* Buidl image: `docker build -t www.yanok.ai .`
* Install node deps: `docker run --rm -p "4000:4000" -v "$(pwd):/site" -it www.yanok.ai npm install`
* Run jekyll: `docker run --rm -p "4000:4000" -v "$(pwd):/site" -it www.yanok.ai`