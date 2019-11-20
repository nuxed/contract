namespace Nuxed\Contract\Http\Message;

/**
 * Defines constants for common HTTP request methods.
 */
enum RequestMethod: string as string {
  Head = 'HEAD';
  Get = 'GET';
  Post = 'POST';
  Put = 'PUT';
  Patch = 'PATCH';
  Delete = 'DELETE';
  Purge = 'PURGE';
  Options = 'OPTIONS';
  Trace = 'TRACE';
  Connect = 'CONNECT';
  Report = 'REPORT';
  Lock = 'LOCK';
  Unlock = 'UNLOCK';
  Copy = 'COPY';
  Move = 'MOVE';
  Merge = 'MERGE';
  Notify = 'NOTIFY';
  Subscribe = 'SUBSCRIBE';
  Unsubscribe = 'UNSUBSCRIBE';
}
