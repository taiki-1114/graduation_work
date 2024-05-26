FROM ruby:3.1.4
ENV LANG C.UTF-8
ENV TZ Asia/Tokyo
ENV RAILS_ENV=production
ENV RAILS_ENV=development
RUN apt-get update -qq \
&& apt-get install -y ca-certificates curl gnupg \
&& mkdir -p /etc/apt/keyrings \
&& curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg \
&& NODE_MAJOR=19 \
&& wget --quiet -O - /tmp/pubkey.gpg https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
&& echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
&& apt-get update -qq \
&& apt-get install -y build-essential libpq-dev nodejs yarn default-mysql-client
RUN mkdir /graduation_work
WORKDIR /graduation_work
RUN gem install bundler:2.3.17
COPY Gemfile /graduation_work/Gemfile
COPY Gemfile.lock /graduation_work/Gemfile.lock
COPY yarn.lock /graduation_work/yarn.lock
RUN bundle install
RUN yarn install
COPY . /graduation_work

COPY start.sh /start.sh
RUN chmod 744 /start.sh
CMD ["sh", "/start.sh"]
