# README

[![Build Status](https://travis-ci.org/satoryu/rws-ruby-sdk-rails-sample.svg?branch=master)](https://travis-ci.org/satoryu/rws-ruby-sdk-rails-sample)

This is a Rails application for demonstrating the gem [`rakuten_web_service`](https://github.com/rakuten-ws/rws-ruby-sdk).

# Usage

## 1. Check out this repository

```
git clone https://github.com/satoryu/rws-ruby-sdk-rails-sample.git
```

## 2. Install bundled gems with

```
cd rws-ruby-sdk-rails-sample
bundle install
```

## 3. Perform db:migration

```
./bin/rake db:create
./bin/rake db:migration
```

## 4. Launch a sever

```
./bin/rails server
```
