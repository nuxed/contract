namespace Nuxed\Contract\Http\Server\Authenticator\Result;

/**
 * Indicates an authentication failure.
 *
 * The authentication attempt has completed.
 */
final class Failure implements IResult {
  public function __construct(private int $responseCode) {}

  /**
   * returns the response code to send to the client.
   */
  public function getResponseCode(): int {
    return $this->responseCode;
  }
}
