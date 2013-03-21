FAF-Labs
========

A place for the lecturers to keep track of the assignments.

Installation
------------

Although not required, it's good to have [RVM](https://rvm.io/) on your system (hopefully you're not on Windows).

You'll also need the native extensions, such as `libsqlite3-dev` and `libcurl3-openssl-dev` for a proper install.
A javascript runtime must also be installed, but I recommend just installing `nodejs` and get rid of the headache.

`cd` into the directory, it'll ask you to install ruby-2.0.0-p0 if you don't have it. If you're not using RVM, you can install that separately.

Then do the following:

    gem install bundler
    bundle install

It will download and install all the necessary libraries. If some of them fail, open an issue and we'll update this guide with proper instructions.

Launching
---------

When you just downloaded it, do the following:

    rake db:migrate
    rake db:seed
    rails s

And then go to `localhost:3000` and voila!

Contributing
------------



> :notes: Fork it, branch it, test it, fail it, 

> :musical_keyboard: Fix it, test it, add commit it.



Submit pull requests. Make sure your commits start with an emoji, @bumbu loves those. Use [this](http://www.emoji-cheat-sheet.com/) to impress him even more.
