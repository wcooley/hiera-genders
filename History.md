
0.2.0 / 2014-08-21
==================

Bugfixes:
 * Return `nil` instead of `false` for unfound attributes. This basically made
   previous releases unusable as `false` is returned instead of the default
   supplied as the second parameter to the `hiera` function.

Features:
 * Add rake tasks to run separate rspec tasks with different hiera_config
   settings. This works around the difficulty changing hiera_config.
 * Set up for Travis CI testing.

0.1.1 / 2014-01-16 
==================

 * Remove fixture symlink; causes module to be not installable.

0.1.0 / 2014-01-16
==================

 * Initial release.
