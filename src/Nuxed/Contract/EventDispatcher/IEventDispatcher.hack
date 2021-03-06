namespace Nuxed\Contract\EventDispatcher;

/**
 * Defines a dispatcher for events.
 */
interface IEventDispatcher {
  /**
   * Provide all relevant listeners with an event to process.
   *
   * @template T as IEvent
   *
   * @return T The Event that was passed, now modified by listeners.
   */
  public function dispatch<<<__Enforceable>> reify T as Event\IEvent>(
    T $event,
  ): Awaitable<T>;
}
