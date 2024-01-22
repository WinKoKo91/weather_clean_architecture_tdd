# Sun Shine

A Flutter Weather App, developed with Bloc, Clean Architecture Get_it and TDD(Text Driven Development).

### Refer
- UI and Project flow - [Real-time Weather App Using Vanilla JavaScript and API](https://www.youtube.com/watch?v=QMwyNnjAils&t=4506s)


### Open Weather Map API Key is required.

In order for the Sunshine app to function properly as of October 18th, 2015 an API key for openweathermap.org must be included with the build.

We recommend that each student obtain a key via the following [instructions](http://openweathermap.org/appid#use), and include the unique key for the build by adding the following line to [USER_HOME]/.gradle/gradle.properties

`apiKey="<UNIQUE_API_KEY">` in lib/core/constants.dart file

# Clean Architecture

## Data Layer

### Models (O)
Models are subclasses of the entities and handle data serialization. They transform data between entities and data sources. Models help to achieve the OCP(Open-Close_principle) principle

### Repositories
Repositories have the implementation of the repository contract defined in the domain layer. They interact with data sources to retrieve data.
Repository implementations allow switching data sources without modifying the domain layer.

### Data Sources(D)
Data sources provide the actual data from external sources(eg. APIs, databases).
They implement the repository interface defined int the domain layer.
Data sources promote modularity and adhere to the DIP principle.

## Domain Layer
### Entities
Entities represent the core data models of the application. They define the structure and properties of the data. Create an entity to be passed around in the application.

### Repositories
Repositories define the contract between the data layer and domain layer. Create a repository to specify the methods for data operations. They handle data operations and follow the DIP principle.

### Usecases(S)
Usecases represent the business logic of the applications.
They depend on the repository and call its methods to perform data operate.
Usecases enforce the SRP principle and focus on specific functionalities.

## Presentation
### Bloc/Cubit
Bloc/Cubit manages the state of the UI and business logic. It depends on usecases to execute business operations.
Bloc/Cubit emits states to the UI, decoupling it from business logic.

### View (S)
Views are responsible for displaying UI components and listening to bloc/cubit states.
They react to state changes and update the UI accordingly.
Views promote the SRP principle by separating presentation logic from business logic.

# TDD - Test-Driven Development
TDD involves writing test before implementing the actual code. Each layer and module can be tested independently.
TDD helps in achieving better code quality and fewer bugs.

# Dependency Injection
Dependency injection is used to provide dependencies to different layer of the app.
It help in managing the dependencies and allows easy swapping of implementations. 
For example. GetIt can be used for dependency injection.
