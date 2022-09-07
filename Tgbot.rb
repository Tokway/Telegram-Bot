#coding: UTF-8
require 'telegram/bot'

TOKEN = '*Тут маэ бути токен, але бот вже працюе на Heroku та не хочу цей самий token засвітити)*'

ANSWERS = [
    # Позитивні 
    "Безперечно", 
    "Вирішено",
    "Ніяких сумнівів", 
    "Виразно так", 
    "Можеш бути впевнений у цьому",
    # Нерішуче позитивні <<так>>"
    "Мені здається так",
    "Хороші перспективи", 
    "Знаки кажуть - так", 
    "Так",
    # Нейтральні 
    "Поки не ясно, спробуй знову", 
    "Запитай пізніше", 
    "Краще не розповідати", 
    "Зараз не можна передбачити", 
    "Сконцентруйся і спитай знову",
    # Негативні 
    "Навіть не думай", 
    "Моя відповідь <<ні>>", 
    "За моїми даними - <<ні>>", 
    "Перспективи не дуже хороші", 
    "Дуже сумнівно"
]

Telegram::Bot::Client.run(TOKEN) do |bot|
    bot.listen do |message|
        case message.text
        when '/start', '/start start'
            bot.api.send_message(
                chat_id: message.chat.id,
                text: "Привіт, #{message.from.first_name} я слухаю тебе, запитай мене та я дам відповідь!"
            )
        else
            bot.api.send_message(
                chat_id: message.chat.id,
                text: ANSWERS.sample
            )
        end
    end
end
