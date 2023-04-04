import 'package:discovery/src/data/data.dart';
import 'package:discovery/src/domain/domain.dart';

List<Map<String, dynamic>> categoriesMockValidData() => [
      {
        "id": "35c0a8e5-47e5-402f-af0e-aeb6cd44698b",
        "description":
            "Quasi quisquam aut. Totam maxime ut. Quia nesciunt officia.",
        "info": {"course_count": 5, "user_count": 5, "enrollment_count": 5},
        "media": {"card_image": "https://loremflickr.com/200/200/education"},
        "name": "Gestao",
        "short_name": null,
        "slug": "gestao"
      },
      {
        "id": "12757aa1-51eb-47f9-82b2-63308733538a",
        "description":
            "Est praesentium ut. Consequuntur perferendis et. Sed debitis quis.",
        "info": {"course_count": 5, "user_count": 5, "enrollment_count": 5},
        "media": {"card_image": "https://loremflickr.com/200/200/education"},
        "name": "Marketing",
        "short_name": null,
        "slug": "marketing"
      },
      {
        "id": "8d373f0f-e51e-492e-8612-ef4b525c457d",
        "description": "Eos numquam autem. Ut suscipit vero. Nostrum in ea.",
        "info": {"course_count": 5, "user_count": 5, "enrollment_count": 5},
        "media": {"card_image": "https://loremflickr.com/200/200/education"},
        "name": "Tecnologia",
        "short_name": null,
        "slug": "tecnologia"
      },
      {
        "id": "8eaeee51-eee4-4523-adb3-da4a9e9b88d1",
        "description":
            "Sapiente molestiae sunt. Et aut labore. Maxime ratione consequatur.",
        "info": {"course_count": 5, "user_count": 5, "enrollment_count": 5},
        "media": {"card_image": "https://loremflickr.com/200/200/education"},
        "name": "Desenvolvimento pessoal",
        "short_name": null,
        "slug": "desenvolvimento-pessoal"
      },
      {
        "id": "fd194605-dcfa-4a17-9051-c35b039b87f9",
        "description":
            "Quod voluptatem praesentium. Exercitationem numquam adipisci. Molestias et et.",
        "info": {"course_count": 5, "user_count": 5, "enrollment_count": 5},
        "media": {"card_image": "https://loremflickr.com/200/200/education"},
        "name": "Artesanato",
        "short_name": null,
        "slug": "artesanato"
      }
    ];

List<CategoryEntity> categoriesMockValidEntity() =>
    RemoteLoadCategoriesModel.fromJson(categoriesMockValidData())
        .toListEntity();
