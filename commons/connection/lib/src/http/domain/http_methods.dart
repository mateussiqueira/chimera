enum HttpMethod {
  connect('connect'),
  delete('delete'),
  get('get'),
  head('head'),
  options('options'),
  patch('patch'),
  post('post'),
  put('put'),
  trace('trace');

  const HttpMethod(this.name);

  final String name;
}
