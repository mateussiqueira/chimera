enum ProductSort {
  mostSearched('most_searched'),
  recommendationScore('recommendation_score'),
  bestFeedback('best_feedback'),
  bestSellers('best_sellers'),
  recents('recents');

  final String apiText;

  const ProductSort(this.apiText);
}
