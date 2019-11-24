namespace Nuxed\Contract\Http\Message;

interface ICookie {
  public function withValue(string $value): this;

  public function withExpires(int $expires): this;


  public function withPath(?string $path): this;

  public function withDomain(?string $domain): this;

  public function withSecure(bool $secure = true): this;

  public function withHttpOnly(bool $httpOnly = true): this;

  public function withoutSecure(): this;

  public function withoutHttpOnly(): this;

  public function withSameSite(?CookieSameSite $sameSite): this;

  public function getValue(): string;

  public function getExpires(): int;

  public function getPath(): ?string;

  public function getDomain(): ?string;

  public function isSecure(): bool;

  public function isHttpOnly(): bool;

  public function getSameSite(): ?CookieSameSite;

  public function toString(): string;
}
