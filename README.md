# proudsourcing-zendguardloader

Puppet module to install ZEND Guard Loader for PHP 5.3 and PHP 5.4 (apache-linux-x64).


## Usage

	class { 'ps_zendguardloader': }


## Configuration

You can define php version, apache modules and php conf.d directory:

	class { 'ps_zendguardloader':
		php_version			=> "php54",
		apache_modules_dir	=> "",
		apache_php_dir		=> ""
	}


Default values:

    $apache_modules_dir		= '/etc/apache2/modules/'
    $apache_php_dir			= '/etc/php5/apache2/'
    $php_version			= 'php53'


## License

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
    

## Copyright

	Proud Sourcing GmbH 2014
	www.proudsourcing.de / www.proudcommerce.com