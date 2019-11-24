namespace Nuxed\Contract\Http\Message;


interface IUri {
  public function getScheme(): string;

  public function getAuthority(): string;

  /**
   * Retrieve the user information component of the URI.
   *
   * If no user information is present, this method MUST return null.
   *
   * If a user is present in the URI, this will return that value;
   * additionally, if the password is also present, it will be appended to the
   * user value, with a colon (":") separating the values.
   *
   * The trailing "@" character is not part of the user information and MUST
   * NOT be added.
   *
   * @return string The URI user information, in "username[:password]" format.
   */
  public function getUserInfo(): ?string;

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
