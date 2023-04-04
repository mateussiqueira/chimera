abstract class Storage {
  save({required key, required value});
  fetch({required key});
  delete({required key});
  clearAll();
}
