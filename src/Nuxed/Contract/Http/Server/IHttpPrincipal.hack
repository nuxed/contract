namespace Nuxed\Contract\Http\Server;

/**
 * Represents a user authenticated by HTTP Basic or Digest authentication.
 */
interface IHttpPrincipal {
  /**
   * returns the contents of this principal in the form realm:username
   */
  public function getName(): string;

  /**
   * returns the realm this object was created with.
   */
  public function getRealm(): string;

  /**
   * returns the username this object was created with.
   */
  public function getUsername(): string;

  /**
   * returns a hashcode for this HttpPrincipal.
   */
  public function hashCode(): int;
}
