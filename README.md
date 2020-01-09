# 新闻管理系统

## 功能

1. 用户：作者（管理自己写的新闻），管理员（管理作者与所有新闻）；
2. 新增，编辑，删除新闻；

# 数据库设计

数据库名：news_system，字符集utf-8

## 新闻news

| 列名             | 类型      | 备注                |
| ---------------- | --------- | ------------------- |
| news_id          | int       | 自增主键            |
| news_title       | varchar   | 100                 |
| news_content     | text      |                     |
| news_post_date   | datetime  |                     |
| news_update_date | timestamp |                     |
| keywords         | varchar   | 30，关键字1~关键字2 |
| author_id        | varchar   | 100                 |
| news_category    | varchar   | 30                  |
| view_count       | int       |                     |

## 作者author

| 列名            | 类型    | 备注 |
| --------------- | ------- | ---- |
| author_id       | varchar | 100  |
| author_password | varchar | 30   |
| author_name     | varchar | 30   |

## 管理员administrator

| 列名           | 类型    | 备注 |
| -------------- | ------- | ---- |
| admin_id       | varchar | 100  |
| admin_password | varchar | 30   |

