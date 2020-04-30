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
    run_sql("SELECT * FROM posts where id = $1", [id])[0]
end