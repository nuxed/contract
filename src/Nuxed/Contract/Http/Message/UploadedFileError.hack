namespace Nuxed\Contract\Http\Message;

enum UploadedFileError: int as int {
  None = 0;
  ExceedsMaxSize = 1;
  ExceedsMaxFormSize = 2;
  Incomplete = 3;
  NoFile = 4;
  TemporaryDirectoryNotSpecified = 5;
  TemporaryDirectoryNotWritable = 6;
  CanceledByExtension = 7;
}
