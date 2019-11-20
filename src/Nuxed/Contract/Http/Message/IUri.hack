namespace Nuxed\Contract\Http\Message;


interface IUri {
  public function getScheme(): string;

  public function getAuthority(): string;

  public function getUserInfo(): (string, ?string);

  public function getHost(): string;

  public function getPort(): ?int;

  public function getPath(): string;

  public function getQuery(): string;

  public function getFragment(): string;

  public function withScheme(string $scheme): this;

  public function withUserInfo(string $user, ?string $password = null): this;

  public function withHost(string $host): this;

  public function withPort(?int $port): this;

  public function withPath(string $path): this;

  public function withQuery(string $query): this;

  public function withFragment(string $fragment): this;

  public function toString(): string;
}
