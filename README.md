# SwiftUI+MVVM+Combine+Modern Concurrency

## 🎥 Demo Video
https://github.com/user-attachments/assets/d18a842e-b289-4e6d-bb8d-abd32894698f

## High-level Design
<img width="756" height="725" alt="Image" src="https://github.com/user-attachments/assets/2470ef26-c6ca-4f3f-8303-7a4b2acc4891" />

## Requirements:
### Functional:
- Fetching and parsing data from API.
- Listing Data.
- Searching.
- Search suggestions.
- Navigation to Details view.

### Non-Functional:
- Performance:
  - Caching images.

- Scalability:
  - Modularity.
  
- Reliability:
  - Unit tests.

## Design Decisions
- UI:
  - SwiftUI
  - MVVM Clean Code Architecture

- Principals and Patterns:
  - SOLID conformance:
    - Features are separated into modules.
    - UseCases for business logic.
  - Coordinator & Router pattern for navigation.

## App Structure

- App
    
- Network Package
  
- Modules -- Characters -- CharacterDetails
    
- UseCases
  
- Services

- Repositories
  
- Resources

- Dependency Manager:
  - Swift Package Manager

- Dependencies:
  - [Kingfisher](https://github.com/onevcat/Kingfisher): Downloading and caching images from the web.



### Author
Created by Mahmoud Salah on 2025. Copyright © 2025 Mahmoud Salah [LinkedIn](https://www.linkedin.com/in/mahmoud-salah-a40465149/).<br/>
Please don't hesitate to ask any clarifying questions about the project if you have any.
