# Instagram Schema Practice
Replicating the schema of popular social media, Instagram, in SQL.

---
## Schemas
- users
  - id: primary key
  - username
  - creation time
  - bio
- photos
  - id: primary key
  - image url
  - user id: foreign key -> users(id)
  - creation time
  - caption
- comments
  - id: primary key
  - comment text
  - user id: foreign key -> users(id)
  - photo id: foreign key -> photos(id)
  - creation time
- likes
  - user id: foreign key -> users(id)
  - photo id: foreign key -> photos(id)
  - creation time
- follows
  - follower id: foreign key -> users(id)
  - following id: foreign key -> users(id)
  - creation time
- tags
  - id: primary key
  - tag name
  - creation time
- photo_tags
  - tag id: foreign key -> tags(id)
  - photo id: foreign key -> photos(id)
