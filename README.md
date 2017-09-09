# NBA Rails

An app to use NBA API to collect, manipulate and analyze NBA games.

Written by Steve Aragon who you can find building awesome things in NYC.

https://github.com/stearagon/nba_rails

## Prerequisites

* [Ruby 2.3](https://rvm.io/)
* [Postgress](https://postgresapp.com/)
* Know your way around a rails app

## Getting started

```
git clone https://github.com/stearagon/nba_rails
cd nba_rails
bundle install

bundle exec rake db:create
bundle exec rake db:migrate

```

## Useful Thor Commands

```
# Fetch all game data between two dates. This will take several hours.
bundle exec thor games:grab_game_and_stats 2016-10-01 2017-07-01

# The play thor commands might have some undocumented data population prerequisites.
bundle exec thor plays:get_play_lineups_for_range 2016-10-01 2017-07-01

# Dump key datasets to excel.
bundle exec thor dump:excel

```

## Useful console wizardry

Launching an interactive rails console may help populate data needed for plays/lineups.

``` 
# Launch an interactive console.
rails c

# To get teams for a season.
graboid = NBAApi::TeamGrab.new("2015-16")
graboid.get_team_info


# To get players for a season.
graboid = NBAApi::PlayerGrab.new("2016-17")
graboid.get_player_info
```
