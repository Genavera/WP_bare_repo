<?php

/**
 * Dynamic wp configuration file.
 *
 * Rename this file emv-config.<environent>.php so this can be used and
 * switched automatically depending on the webserver environment config
 */

define('DB_NAME', 'database_name_here');
define('DB_USER', 'username_here');
define('DB_PASSWORD', 'password_here');
define('DB_HOST', 'localhost');
define('DB_CHARSET', 'utf8');
define('DB_COLLATE', '');

$table_prefix  = 'wp_';

define('WP_DEBUG', false);

