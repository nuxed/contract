namespace Nuxed\Contract\Http\Server;

use namespace Nuxed\Contract\Http\Message;

trait HandlerMiddlewareTrait implements IMiddleware {
  require implements IHandler;

  public async function process(
    Message\IServerRequest $request,
    IHandler $_handler,
  ): Awaitable<Message\IResponse> {
    return await $this->handle($request);
  }
}
