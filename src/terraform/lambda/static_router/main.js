function handler(event) {
  var request = event.request;
  var uri = request.uri;

  // URIにファイル名が欠けているかチェックする。
  if (uri.endsWith('/')) {
    request.uri += 'index.html';
  }
  // URIにファイル拡張子が欠けているかチェックする。
  else if (!uri.includes('.')) {
    request.uri += '/index.html';
  }

  return request;
}