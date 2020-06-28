<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wp_testapp' );

/** MySQL database username */
define( 'DB_USER', 'wordpress' );

/** MySQL database password */
define( 'DB_PASSWORD', 'wordpress' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '@iPB4ev8=Mb!z1Tvmb47rrw?v?oC)6$RGxv{* k.-a0F|%74dTt^<rf`F3d}P:4~');
define('SECURE_AUTH_KEY',  '2n:HY)b4U`rAA$W$y9NYa*/_]9)Hr@2|CN,:B-jXbf;,|7Fe-x-sT4$Z^b8?p`UU');
define('LOGGED_IN_KEY',    ')vAv}(tuTiP[TM*|cG&pHb@~~-Nanl<]nB4|h|/K+f`TA$Nk!i:`:1$Z9^vnij,(');
define('NONCE_KEY',        '3-U0,y %O/y~fY}j@w]XUFxeYS_8O(`2}_GhzT3E,Hmt;1i$g~(O*i6 J`G$#9d;');
define('AUTH_SALT',        'X@*w0KwOv?kuxR;,zJjs8~$9@EG>g|<ac-@EtMThK?J&WY%PW4%Ct&KG3.UCSPaa');
define('SECURE_AUTH_SALT', 'g,I}vB&NG-*tQAzBq>:i4.d:?3;Z[6ts+>W(R9v[Pxid+6+,-d*T)v7S%{4NyiE7');
define('LOGGED_IN_SALT',   'azce&h*|RM_Ef)m<zm^}}Y-:HF[g@I[#@^geX%w0aG}u);+(~?I1}jN&oakssG%<');
define('NONCE_SALT',       'L(7jn?{hTD(=+W5!IN+ud|:,<8IDyr-;9m38vNs*wiGpB6XJvn&}b-;moHHmjt|r');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/*
define( 'WP_SITEURL',     'http://localhost/' );
define( 'WP_HOME',        'http://localhost/' );
*/


/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
