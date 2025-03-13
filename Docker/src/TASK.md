## Part 1. Готовый докер

Возьми официальный докер-образ с nginx и выкачай его при помощи docker pull.

![](./images/part1_1.png)

**Результат команды docker pull nginx**

Проверь наличие докер-образа через docker images.

![](./images/part1_2.png)

**Результат команды docker images**

Запусти докер-образ через docker run -d [image_id|repository].

![](./images/part1_3.png)

**Результат команды docker run -d nginx**

Проверь, что образ запустился через docker ps.

![](./images/part1_4.png)

**Результат команды docker ps**

Посмотри информацию о контейнере через docker inspect [container_id|container_name].

![](./images/part1_5.png)

**Результат команды docker inspect**

По выводу команды определи и помести в отчёт размер контейнера, список замапленных портов и ip контейнера.

![](./images/part1_6.png)

**Размер контейнера**

![](./images/part1_7.png)

**Список замапленных портов**


Останови докер контейнер через docker stop [container_id|container_name].

Проверь, что контейнер остановился через docker ps.

Запусти докер с портами 80 и 443 в контейнере, замапленными на такие же порты на локальной машине, через команду run.

Проверь, что в браузере по адресу localhost:80 доступна стартовая страница nginx.

Перезапусти докер контейнер через docker restart [container_id|container_name].

Проверь любым способом, что контейнер запустился.