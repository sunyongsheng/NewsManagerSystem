# 新闻管理系统
## 功能
1. 用户：初级管理员（管理自己写的新闻），高级管理员（管理初级管理员）；
2. 新增，编辑，删除新闻；

# 数据库设计
## 新闻
| 列名 | 类型 | 备注 |
news_id int 自增主键
news_title varchar 100
news_content varchar 4000
news_post_date date
news_update_date date
