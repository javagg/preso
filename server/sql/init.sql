-- Active: 1743494241905@@127.0.0.1@5432@preso
INSERT INTO "tenant" ("id", "name", "description")
VALUES (1, 'master', 'master')

INSERT INTO serverpod_user_info("id", "userIdentifier", "userName", "email", "scopeNames", "blocked", "created")
VALUES (1, 'admin@nowhere.com', 'admin', 'admin@nowhere.com', '[]', false, CURRENT_TIMESTAMP)

INSERT INTO serverpod_email_auth("id", "userId", "email", "hash")
VALUES (1, 1, 'admin@nowhere.com', '$argon2id$zZuJocIQeeIsjhmY$rDwxnRHIO3RitPnZHlWwfMms9GXuv0S96kXijVpxm1NhwonKs2qRmJqcPCtXQtGoaqM+TnYQD7C90SkaB34mKT0L2+/GvpE2OptvM/M3aonU7BIF/9HtOhRF7nZNv95A+WQf3h+fgsoYt5pKAhmwUjOywiHNuxnu8cGMQiOhG7WwQ8nzIks1kLGf5I4O0ox47wXqChw2kMMnXA8cs6FhhCZGgzyjweO/etRIFdMouioiuCON5UWcF2l+fm3uk6wFjl5omTMJl/E12mKwh9TSIjBjefVAbr1k/afyIWwKT6bjMRvmudP5zusOc4k79znYYgixQfYfAfdXsDduYjk4VA==')

INSERT INTO "user"("id", "name", "userInfoId") VALUES (1, 'Admin', 1)

INSERT INTO "store" ("id", "tenantId", "name", "city", "province", "longitude", "latitude", "tags")
VALUES (1, 1, '关山大道店', 'wuhan', 'hubei', 114.000000, 30.500000, '["24小时", "月付制", "无打扰"]')
