# TI Storage

[![CircleCI](https://circleci.com/gh/MarketMyMarket/ti_storage.svg?style=svg&circle-token=8b43ef65646ca1b47d919826a934f3a8e1d59648)](https://circleci.com/gh/MarketMyMarket/ti_storage)

## Slack

Find us on [our nexa slack channel](http://nexahq.slack.com/ "nexahq")

## Development

### Requirements

* Git and Github account
* Docker
* Ruby (preferably with RVM)

### Waffle.io

Waffle.io is the kanbam board we use, which utilizes Github's issues feature as it's data store. All project management is done through this tool, and it is fairly simple and straight forward. You will need to refer to this tool to find the work that needs to be performed.

Cards are created, with the statement of work and acceptance criteria, outlining what is to be performed to complete said card.

There are 4 phases for which cards must traverse before becoming complete. All new cards begin in the `Ready` column, and are ordered in order of importance, with the ones on top being of more importance, and therefore take precedence and are to be completed prior to any card below it being started.

All development is to be performed in feature branches, with a specific naming convention. For example, for card #99, 'Add Image Uploading'

`git checkout -b 99-add-image-uploading`

When you publish this branch, it moves the ticket from `Ready` and places it in `In Progress`

### Rubocop

Ensure all code committed passes rubocop. You can run rubocop via the following command:

`make lint`

### RSpec

Ensure all code committed passes rspec. You can run rspec via the following command:

`make rspec`

### Continuous Integration with CircleCI

We use [CircleCI](http://circleci.com/ "CircleCI") for our continuous integration. Every new PR is automatically built, and ran in CI. It's results will be sent to slack in the `#builds` channel.

### Pull Requests

Once you have completed a feature in your featured branch, push the changes to Github:

`git push`

Then, on Github, create a Pull-Request with your changes. We want to use a simple message using one of the following keywords followed by referencing the original issue #.

##### keywords:
* close, closes, closed
* fix, fixes, fixed
* resolve, resolves, resolved

For example:

`closes #99`

Including a keyword and the issue # in your PR message will close that issue once it is merged into your default branch. This will automatically move the issue to the Done column on your Waffle board.

# Heroku

`heroku pg:reset DATABASE_URL --app desolate-fortress-66664-pr-99`
`heroku run rake db:migrate --app desolate-fortress-66664-pr-99`
`heroku run rake db:seed --app desolate-fortress-66664-pr-99`
