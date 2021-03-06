namespace Nuxed\Contract\EventDispatcher\ListenerProvider;

use namespace Nuxed\Contract\EventDispatcher\{Event, EventListener};

/**
 * Mapper from an event to the listeners that are applicable to that event.
 */
interface IListenerProvider {
  /**
   * Retrieve all listeners for the given event type.
   *
   * @return AsyncIterator<EventListener\IEventListener<T>>
   *   An async iterator (usually an async generator) of listeners.
   *   Each listener MUST be type-compatible with T.
   */
  public function getListeners<<<__Enforceable>> reify T as Event\IEvent>(
  ): AsyncIterator<EventListener\IEventListener<T>>;
}
