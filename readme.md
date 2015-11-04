# Mys-bot
Ernst loves you

## Tools needed
- [Node](https://nodejs.org/en/)

## Setup bot on Slack
You will need your own bot for testing. Here's how you set one up.

- [Create a bot on Slack](https://mysgruppen.slack.com/services/new/bot)
- Copy the API key
- Duplicate the `.env.dist`-file and name it `.env`
- Set SLACK_KEY variable in `.env` to you actual API key from Slack
- Move bot to a private channel using the web or desktop client.
- Your bot is now ready to be controlled by your will.

## Quickstart
- `cd path/to/project`
- `npm install`
- `npm start`
- You should now see a message saying you have connected as the bot you just created

## Contribute
- We follow the [Javascript Standard code style](https://github.com/feross/standard). Download a linter to your editor to make sure you follow the code style.
- Never merge directly into master branch. Develop features on branches and submit pull requests.