namespace Nuxed\Contract\Http\Server\Authenticator\Result;

use namespace Nuxed\Contract\Http\Server;

/**
 * Indicates an authentication has succeeded and the authenticated
 * user principal can be acquired by calling getPrincipal().
 */
final class Success implements IResult {
  public function __construct(private Server\IHttpPrincipal $httpPrincipal) {}

  /**
   * returns the authenticated user Principal
   */
  public function getPrincipal(): Server\IHttpPrincipal {
    return $this->httpPrincipal;
  }
}
