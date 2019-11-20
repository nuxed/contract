namespace Nuxed\Contract\Http\Server\Authenticator;

use namespace Nuxed\Contract\Http\Message;

interface IAuthenticator {
  public function authenticate(
    Message\IServerRequest $request,
  ): Awaitable<Result\IResult>;
}
