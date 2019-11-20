namespace Nuxed\Contract\Http\Session;

enum CacheLimiter: string as string {
  NoCache = 'nocache';
  Public = 'public';
  Private = 'private';
  PrivateNoExpire = 'private_no_expire';
}
