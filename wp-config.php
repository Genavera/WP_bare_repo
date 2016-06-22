<?php

define('ENVIRONMENT', isset($_SERVER['WP_ENV']) ? $_SERVER['WP_ENV'] : 'dev');
require_once("env-config." . ENVIRONMENT . ".php");

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'put your unique phrase here');
define('SECURE_AUTH_KEY',  'put your unique phrase here');
define('LOGGED_IN_KEY',    'put your unique phrase here');
define('NONCE_KEY',        'put your unique phrase here');
define('AUTH_SALT',        'put your unique phrase here');
define('SECURE_AUTH_SALT', 'put your unique phrase here');
define('LOGGED_IN_SALT',   'put your unique phrase here');
define('NONCE_SALT',       'put your unique phrase here');

if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/WP');

require_once(ABSPATH . 'wp-settings.php');

/** Sets up WordPress vars and included files. */
define( 'WP_CONTENT_DIR', dirname( __FILE__ ) . '/WP-custom' );
define( 'WP_CONTENT_URL',  get_option('siteurl') . '/WP-custom' );