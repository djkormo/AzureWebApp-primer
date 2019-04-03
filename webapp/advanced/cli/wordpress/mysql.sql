create user 'wordpress' IDENTIFIED BY "WP-Passw0rd"; 
GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'; 
FLUSH PRIVILEGES;