require 'bcrypt'

def run_sql(sql, params = []) 
    connection = PG.connect(dbname: 'flexnet')
    records = connection.exec_params(sql, params)
    connection.close
    records
end 

def all_users()
    run_sql('select * from users;')
end

def find_one_user_by_email(email)
    records = run_sql('select * from users where email = $1', [email])
    if records.count == 0
        return nil
    else 
        return records[0] 
    end
end

def add_user(email, name, username, password)                   
    password_digest = BCrypt::Password.create(password)
    run_sql("INSERT INTO users (email, name, username, password_digest)
    VALUES ($1, $2, $3, $4);", [email, name, username, password_digest])
end

def update_user(username, name, bio, image_url, id) 
    run_sql("UPDATE users SET username = $1, name = $2, bio = $3, image_url = $4 where id = $5", [username, name, bio, image_url, id])
end