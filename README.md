# Smarty

Smarty is a chat bot built on the [Hubot][hubot] framework.

## Architecture

Use AMQP to route tasks to agents that run on any machines as long as they can
talk to the queue server.

[hubot]: http://hubot.github.com
[RabbitMQ]: http://www.rabbitmq.com
[amqp.node]: https://github.com/squaremo/amqp.node

