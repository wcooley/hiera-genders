hiera-genders
=============

Provides a [genders][1] backend for Hiera.

Author
------
* Wil Cooley wcooley(at)nakedape.cc

Example
-------

To try it out with the `hiera` command outside of Puppet:

    $ RUBYLIB=`pwd`/lib hiera -c spec/fixtures/hiera/good/hiera.yaml foo hostname=host1
    bar
    $ RUBYLIB=`pwd`/lib hiera -c spec/fixtures/hiera/good/hiera.yaml oof hostname=host1
    true

License
-------

    Author:: Wil Cooley (wcooley(at)nakedape.cc)
    Copyright:: Copyright (c) 2013 Wil Cooley
    License:: Apache License, Version 2.0

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.

Testing
-------

Due to what appears to be a bug in the new hiera support in `rspec-puppet`, it
is not possible to change the `hiera_config` so running just `rake spec` or `rspec`
at the top of the tree fails. Instead, run the tests separately:

    $ rspec spec/functions/hiera_genders_broken_spec.rb
    $ rspec spec/functions/hiera_genders_good_spec.rb

Support
-------

Please log tickets and issues at our [Github project][2].

[1]: https://computing.llnl.gov/linux/genders.html
[2]: https://github.com/wcooley/hiera-genders/issues
