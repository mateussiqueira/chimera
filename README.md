# Chimera
<p align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="./chimera_dark.svg">
    <img alt="Chimera Illustration" src="./chimera.svg">
  </picture>
</p>

> "Chimera is a monster from Greek mythology, described as having the body of a lion, the tail of a dragon, and the head of a goat. She was the daughter of Typhon and Echidna, two of the most feared creatures in Greek mythology, and was created by Hera to pursue and kill Hercules as a test of his strength and courage."

This monorepo is just like Chimera: contains several parts (micro frontends and common packages) capable of produce a new OPX product.

## Technologies

Chimera is backended by [Atlas](https://github.com/qcx/atlas) and are built using [Flutter](https://flutter.dev/) and [Dart](https://dart.dev/).

## Micro Frontend Architecture

Each micro frontend is a standalone Flutter package that extends from a MicroApp. It can communicate with other micro frontends by [Event Bus](commons/marcopolo) and backend services via REST APIs. This allows for independent development, code reuse, less complexity inside micro frontend, reusability in any Flutter application capable of handling the micro frontend and deployment of each micro frontend separately.

## Micro Frontends

To get started with a specific micro frontend, please see the corresponding folder within the repository. Each project has its own documentation and instructions (if applicable). Please see the corresponding folder within the repository for more information.


|               Name 	               | Short Description 	                                                           |
|:----------------------------------:|-------------------------------------------------------------------------------|
| [authentication](authentication) 	 | Authentication frontend with Credentials and Sign-ins with Google & Apple. 	  |
|       [learning](learning) 	       | Provide view from Enrollments, Contents & Assessments. 	                      |
|      [discovery](discovery) 	      | Show, search and provide details of products and their categories 	           |
|       [checkout](checkout) 	       | Shows, manages and initiates the purchasing flow 	                            |
|        [profile](profile) 	        | Responsible for user details, their certificates, help center and law stuff 	 |

# chimera
