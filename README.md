# 新闻管理系统

利用基础JavaWeb知识，基础css语法，基础js方法构建的简单新闻管理系统；

## 功能

1. 作者（管理自己写的新闻），管理员（管理作者与所有新闻）；
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
| keywords         | varchar   | 30，关键字1,关键字2 |
| author_id        | varchar   | 100                 |
| news_category    | varchar   | 30                  |
| view_count       | int       | default 0                  |

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

# 页面
```
|- add-author.jsp       // 管理员添加作者
|- add-news.jsp         // 新增新闻
|- admin.jsp            // 管理员页面
|- author-admin.jsp     // 作者管理页面
|- edit-author.jsp      // 管理员编辑作者
|- edit-news.jsp        // 编辑新闻页面
|- index.jsp            // 主页
|- login.jsp            // 登录页
|- register-author.jsp  // 注册作者页面
|- view-news.jsp        // 查看新闻页面
```

# 目录结构
```
|- src
    |- top.aengus
            |- dao
                |- impl
                    |- AdminDao
                    |- AuthorDao
                    |- NewsDao
                |- interfaces
                    |- AdminInterface
                    |- AuthorInterface
                    |- NewsInterface
            |- pojo
                |- News
                |- Author
                |- Admin
            |- service
                |- AddAuthorServlet
                |- AddNewsServlet
                |- DeleteAuthorServlet
                |- DeleteNewsServlet
                |- EditAuthorServlet
                |- EditNewsServlet
                |- ExistIdServlet
                |- GetAllNewsServlet
                |- GetNewsByCategoryServlet
                |- LoginServlet
                |- SaveEditedNewsServlet
                |- SaveEditedAuthorServlet
                |- SearchNewsByTitleServlet
                |- ViewNewsSevrlet
            |- utils
                |- DBUtil
```

# 页面跳转逻辑

1. 打开浏览器
2. 跳转到`GetAllNewsServlet`，发现无用户信息
3. 跳转到index.jsp
4. 点击搜索，跳转到`SearchNewsByTitleAndKeywordsServlet`;
5. 点击分类名称，跳转到`GetNewsByCategoryServlet`;
6. 点击新闻，跳转到`ViewNewsServlet`;
7. 点击登录，跳转到`LoginServlet`;
8. 根据账号，自动判断为作者还是管理员，然后跳转到管理员管理页面或读者管理页面中；
7. 编辑作者或新闻，跳转到`EditAuthorServlet`或者`EditNewsServlet`；
8. 点击保存，跳转到`SaveEditedNewsServlet`;
9. 点击退出，跳转到`GetAllNewsServlet`;