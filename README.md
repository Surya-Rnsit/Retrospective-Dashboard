Ruby version - '2.6.2'
Rails Version - '5.2.6'
Database - sqlite3

Installation Guide:

WSL guide:
https://gorails.com/setup/windows/10

install RVM:
sudo apt-get install libgdbm-dev libncurses5-dev automake libtool bison libffi-dev
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
rvm install 3.0.1
rvm use 3.0.1 --default
ruby -v

Install bundler by running gem install bundler

Install NodeJS and the Yarn Package Manager by running the following commands

> curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
> curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
> echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

> sudo apt update
> sudo apt-get install -y nodejs yarn

Install Rails
> gem install rails -v 5.2.6
> rails -v

Run the following command to install rails, bundler 

> gem install rails
> gem install bundler

Run the following commands
> bundle install

Starting the server
Run rails db:migrate to migrate databases.

Run rails server or rails s

You can now visit http://localhost:3000 to view the project!