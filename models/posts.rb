def add_new_post(description, image_url, user_id) 
    run_sql("
    INSERT INTO posts (description, image_url, user_id)
    VALUES ($1, $2, $3);", [description, image_url, user_id]
    )
end

def all_posts()
    run_sql('SELECT * FROM posts ORDER BY id DESC;')
end

def update_post(description, image_url, id)
    run_sql("UPDATE posts SET description = $1, image_url = $2 WHERE id = $3;", [description, image_url, id])
end

def find_post_by_id(id)
    run_sql("SELECT * FROM posts where id = $1", [id])
end

def find_comments_by_id(id)
    run_sql("SELECT comments FROM posts WHERE id = $1;",[id])
end

def find_user_id_by_post(post_id)
    run_sql("Select user_id from posts where id = $1", [post_id])[0]
end

def find_amount_of_posts(id)
    run_sql("SELECT * from posts where user_id = $1 ORDER BY id DESC;", [id])
end

def delete_post(id)
    run_sql("delete from posts where id = $1", [id])
end