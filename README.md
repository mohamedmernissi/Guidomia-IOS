# Guidomia-IOS

For this project i used the VIPER architecture, with 1 module:

    Main Module that contains the logic of fetching data from the json file and storing it in a model.
    
Viper stands for : 
    
    - View : the interface layer.
    - Interactor : responsible for retrieving data from the model layer,
    - Presenter : It connects view with other components.
    - Entity : Plain model classes used mostly by the interactor.
    - Router : The navigation logic of the application using UIKit classes ( for transitions between screens).
